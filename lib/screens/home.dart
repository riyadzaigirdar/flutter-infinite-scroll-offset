import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _controller = ScrollController();
  final List<String> items = [];
  bool loading = false, allLoaded = false;

  void mockFetch() async{
    if(allLoaded){
      return;
    }

    setState(() {
      loading = true;
    });

    await Future.delayed(Duration(milliseconds: 2000));

    List<String> newItems = items.length >= 60 ? [] : List.generate(20, (index) => 'item ${index+1}');
    
    if(newItems.isNotEmpty){
        items.addAll(newItems);
    }

    setState(() {
      loading = false;
      allLoaded = newItems.isEmpty;
    });
  }

  @override
  void initState(){
    super.initState();
    mockFetch();
    _controller.addListener(() { 
      if(_controller.position.pixels >= _controller.position.maxScrollExtent && !loading){
        mockFetch();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite Scroll"),
        backgroundColor: Colors.pink[400],
      ),
      body: Scrollbar(
        radius: Radius.circular(20.0),
        child: LayoutBuilder(
          builder: (context, constraints){
              if(items.isNotEmpty){
                return Stack(
                        children: [
                          ListView.separated(
                            controller: _controller,
                            itemBuilder: (context, index){
                              if(index < items.length){
                                return ListTile(
                                  title: Text(items[index]),
                                );
                              }else{
                                return ListTile(
                                  title: Text(
                                    "No more items to load",
                                    style: TextStyle(
                                      color: Colors.red
                                    ),
                                  ),
                                );
                              }
                            }, 
                            separatorBuilder: (context, index){
                              return Divider(height: 5,);
                            }, 
                            itemCount: allLoaded ? (items.length + 1): items.length
                          ),
                        if(loading)
                        Positioned(
                          bottom: 5,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: CircularProgressIndicator()
                          )
                        )
                        ],
                      );
              }else{
                if(Platform.isAndroid){
                  return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.green,
                        semanticsLabel: "loading",
                      ),
                  );
                }else{
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
              }
          },
        ),
      ),
    );
  }
}