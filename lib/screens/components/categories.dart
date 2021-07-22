import 'package:flutter/material.dart';
import '../../models/food.dart';
class Categories extends StatelessWidget {
  final data = getFoodData();
  final bool closed;

  Categories({
    required this.closed
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedOpacity(
      opacity: closed ? 0 : 1, 
      duration: Duration(milliseconds: 200),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        alignment: Alignment.topCenter,
        height: closed? 0 : size.height * 0.30,
        width: size.width,
        child: Container(
          height: size.height * 0.3,
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                    child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              height: size.height * 0.27,
                              width: size.width * 0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.blue[600]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                                    child: Text(
                                      "Most Favourites",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),  
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                                    child: Text(
                                      "20 Items",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              height: size.height * 0.27,
                              width: size.width * 0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.orange
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                                    child: Text(
                                      "Newest",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),  
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                                    child: Text(
                                      "20 Items",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              height: size.height * 0.27,
                              width: size.width * 0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.blue[300]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                                    child: Text(
                                      "Super Savings",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),  
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                                    child: Text(
                                      "20 Items",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                  ),
                ),
              ),
      ),
    );
  }
}