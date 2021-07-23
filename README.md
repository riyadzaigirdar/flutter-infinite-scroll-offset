# Type Casting or Map Object key value to dynamic(dynamic is the best way)

        import 'package:flutter/material.dart';

        import '../constants.dart';

        class FoodData {
        final String? name;
        final String? brand;
        final double? price;
        final String? image;

        const FoodData({
            @required this.name,
            @required this.brand,
            @required this.price,
            @required this.image
        });

        }

        List<FoodData> getFoodData(){
        List<FoodData> arr = [];
        for (var i = 0; i < FOOD_DATA.length; i++) {
            var item = FOOD_DATA[i];

            var name = item["name"].toString();
            var brand = item["brand"].toString();
            var price = double.parse(item["price"].toString());
            var image = item["image"].toString();
            
            <----OR---->

            var name = item["name"] as String;
            var brand = item["brand"] as String;
            var price = item["price"] as double;
            var image = item["image"] as String;

            arr.add(
            FoodData(
                name: name,
                brand: brand,
                price: price,
                image: image
            )
            );

        }

        return [
            ...arr
        ];
        }

# map object key value to dynamic

    const FOOD_DATA = <Map<String, dynamic>>[
        {
            "name":"Burger",
            "brand":"Hawkers",
            "price":2.99,
            "image":"burger.png"
        },{
            "name":"Cheese Dip",
            "brand":"Hawkers",
            "price":4.99,
            "image":"cheese_dip.png"
        },
        {
            "name":"Cola",
            "brand":"Mcdonald",
            "price":1.49,
            "image":"cola.png"
        },
        {
            "name":"Fries",
            "brand":"Mcdonald",
            "price":2.99,
            "image":"fries.png"
        },
        {
            "name":"Ice Cream",
            "brand":"Ben & Jerry's",
            "price":9.49,
            "image":"ice_cream.png"
        },
        {
            "name":"Noodles",
            "brand":"Hawkers",
            "price":4.49,
            "image":"noodles.png"
        },
        {
            "name":"Pizza",
            "brand":"Dominos",
            "price":17.99,
            "image":"pizza.png"
        },
        {
            "name":"Sandwich",
            "brand":"Hawkers",
            "price":2.99,
            "image":"sandwich.png"
        },
        {
            "name":"Wrap",
            "brand":"Subway",
            "price":6.99,
            "image":"wrap.png"
        }
        ];