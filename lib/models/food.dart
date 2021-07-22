import '../constants.dart';

class FoodData {
  final String name;
  final String brand;
  final String price;
  final String image;

  const FoodData({
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
  });
}

List<FoodData> getFoodData(){
  List<FoodData> arr = [];
  for (var i = 0; i < FOOD_DATA.length; i++) {
    var item = FOOD_DATA[i];
    var name = item["name"].toString();
    var brand = item["brand"].toString();
    var price = item["price"].toString();
    var image = item["image"].toString();
    
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