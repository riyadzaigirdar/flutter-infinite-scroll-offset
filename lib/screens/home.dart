import 'package:flutter/material.dart';
import 'package:infinite_scroll/screens/components/categories.dart';
import 'package:infinite_scroll/screens/components/items.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _controller = ScrollController();
  bool closed = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() { 
      closed = _controller.offset > 50;
      setState(() {});
    });
  }
  
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                leading: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                actions: [
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(
                      Icons.person, 
                      color: Colors.black,
                    )
                  )
                ],
              ),
              body: Container(
                height: size.height,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Loyalty Cards",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        Text(
                          "Menu",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Categories(closed: closed),
                    Expanded(
                      child: Items(
                        controller: _controller,
                      )
                    )
                  ],
                  ),
              ),
            )
          );
  }
}