import '../constants.dart';

class FoodData {
  final String name;
  final String brand;
  final double price;
  final String image;

  const FoodData({
    required this.name,
    required this.brand,
    required this.price,
    required this.image
  });

}

// List<FoodData> getFoodData(){
//   List<FoodData> arr = [];
//   for (var i = 0; i < FOOD_DATA.length; i++) {
//     var item = FOOD_DATA[i];
//     var name = item["name"];
//     var brand = item["brand"];
//     var price = item["price"];
//     var image = item["image"];
    
//     arr.add(
//       FoodData(
//         name: name,
//         brand: brand,
//         price: price,
//         image: image
//       )
//     );

//   }

//   return [
//     ...arr
//   ];
// }


List<FoodData> getFoodData(){
  List<FoodData> arr = [];
  for (var i = 0; i < FOOD_DATA.length; i++) {
    var item = FOOD_DATA[i];
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

// List<FoodData> getFoodData(){
//   List<FoodData> arr = [];
//   for (var i = 0; i < FOOD_DATA.length; i++) {
//     var item = FOOD_DATA[i];
//     var name = item["name"].toString();
//     var brand = item["brand"].toString();
//     var price = double.parse(item["price"].toString());
//     var image = item["image"].toString();
    
//     arr.add(
//       FoodData(
//         name: name,
//         brand: brand,
//         price: price,
//         image: image
//       )
//     );

//   }

//   return [
//     ...arr
//   ];
// }