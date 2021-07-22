import 'package:flutter/material.dart';
import 'package:infinite_scroll/models/food.dart';

class Items extends StatelessWidget{
  final List<FoodData> data = getFoodData();
  final ScrollController controller;

  Items({
    required this.controller,
  });

  @override
  Widget build(BuildContext context){
    return Container(
       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: ListView.builder(
        controller: controller,
        itemCount: data.length,
        itemBuilder: (context, index){
          return Align(
            heightFactor: 0.7,
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0, top: 5.0),
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.1, 0.1),
                    color: Colors.black.withOpacity(0.23),
                    blurRadius: 2,
                    spreadRadius: 2
                  ),
                  BoxShadow(
                    offset: Offset(-0.1, -0.1),
                    color: Colors.black.withOpacity(0.23),
                    blurRadius: 2,
                    spreadRadius: 2
                  )
                ]
              ),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index].name,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            data[index].brand,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.23)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "\$ ${data[index].price}",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
              ),
          );
        }),
    );
  }
}