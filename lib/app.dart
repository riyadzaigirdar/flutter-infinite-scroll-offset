import 'package:flutter/material.dart';


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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  // AnimationController controllerOne;
  // Animation<Color?> animationOne;
  // Animation<Color?> animationTwo;

  var controllerOne;
  var animationOne;
  var animationTwo;

  @override
  void initState() {
    super.initState();
    controllerOne = AnimationController(
        duration: Duration(milliseconds: 2000),
        vsync: this);
    animationOne = ColorTween(begin: Colors.grey,end: Colors.white70).animate(controllerOne);
    animationTwo = ColorTween(begin: Colors.white70,end: Colors.grey).animate(controllerOne);
    controllerOne.forward();
    controllerOne.addListener((){
      if(controllerOne.status == AnimationStatus.completed){
        controllerOne.reverse();
      } else if(controllerOne.status == AnimationStatus.dismissed){
        controllerOne.forward();
      }
      this.setState((){});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerOne.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ShaderMask(
                shaderCallback: (rect){
                  return LinearGradient(
                      tileMode: TileMode.mirror,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [animationOne.value,animationTwo.value]).createShader(rect,textDirection: TextDirection.ltr);
                },
                child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 8.0,
              color: Colors.white,
            ),
            SizedBox(height: 5,),
            Container(
              width: double.infinity,
              height: 8.0,
              color: Colors.white,
            ),
            SizedBox(height: 5,),
            Container(
              width: 40.0,
              height: 8.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
    )
              ),
            ],
          ),
        )
      ),
    );
  }
}

