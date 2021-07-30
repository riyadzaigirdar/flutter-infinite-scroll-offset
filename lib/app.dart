import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


class App  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = false;
  Directory? dir;
  double progress = 0.0;
  final Dio dio = Dio();

  Future<bool> downloadFile(String url, String fileName) async{
    
    try {
      // permission na dile direct failed
      // Android 
        if (Platform.isAndroid){
          if(await _requestPermission(Permission.storage)){
            dir = await getExternalStorageDirectory();
            var newPath = dir?.path.split("/Android")[0];
            newPath = newPath! + "/video";
            dir = Directory(newPath.toString());
            print(dir?.path);
          }
        }else{
        // IOS
          print("in ios");
          if(await _requestPermission(Permission.photos)){
            dir = await getTemporaryDirectory();
            print(dir);
          }else{
            print("rejected");
            return false;
          }
        }

        if(!await dir!.exists()){
          dir?.create(recursive: true);
        }
        if(await dir!.exists()){
          File saveFile = File(dir!.path + "/$fileName");
          await dio.download(
            url, 
            saveFile.path, 
            onReceiveProgress: (downloaded, totalSize){
              setState(() {
                progress = downloaded / totalSize;
              });
            }
          );
          if(Platform.isIOS){
            await ImageGallerySaver.saveFile(saveFile.path, isReturnPathOfIOS: true);
          }
        }
    } catch (e) {
      print(e);
    }
    return false;
  }
  Future<bool> _requestPermission(Permission permission) async{
    if(await permission.isGranted){
      return true;
    }else{
      PermissionStatus result = await permission.request();
      if(result == PermissionStatus.granted){
        return true;
      }else{
        return false;
      }
    }
  }
  void processDownload() async{
    setState(() {
      loading = true;
    });

    bool downloaded = await downloadFile("https://kalke.co/media-employers/logo1.png", "logo.png");
    if(downloaded){
      print("file downloaded");
    }else{
      print("failed downloading");
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: loading?
        CircularProgressIndicator(
          value: progress,
        ):
        Center(
          child: ElevatedButton(
            
            onPressed: processDownload,
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)
            ),
            child: Text(
              "Download Video",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
              ),
            )
          ,),
      ),
    );
  }
}

