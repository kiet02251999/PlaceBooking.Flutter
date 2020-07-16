import 'package:booking_place/src/models/category_model.dart';
import 'package:flutter/material.dart';

//

class CategoryProvider with ChangeNotifier {
  List<Category> _categorys = [];

  List<Category> get categorys {
    return _categorys;
  }

  Future<void> getCategory() async {
    /*final url = '${Endpoints.reviews}';
    final response = await http.get(url);
    var jsonResponse = json.decode(response.body);
    var review =
        jsonResponse.map<Review>((item) => new Review.fromJson(item)).toList();
    if (jsonResponse == null) {
      return;
    }*/
    await Future.delayed(Duration(seconds: 1));
    _categorys = [
      new Category(
          id: 1,
          name: "Hotel",
          imageUrl:
              'https://pix10.agoda.net/hotelImages/124/1246280/1246280_16061017110043391702.jpg?s=1024x768'),
      new Category(
          id: 2,
          name: "Motel",
          imageUrl:
              'https://r-cf.bstatic.com/images/hotel/max1024x768/148/148672944.jpg'),
      new Category(
          id: 3,
          name: "Home stay",
          imageUrl:
              'https://www.hoteljob.vn/files/Anh-HTJ-Hong/homestay-la-gi-1.jpg'),
      new Category(
          id: 4,
          name: "Villa",
          imageUrl:
              'https://q-xx.bstatic.com/xdata/images/hotel/840x460/171170838.jpg?k=61e429dc79a6ca574886d85e577d413adea5d4c9e6cf76dff15b9b7c1c60fcc7&amp;o='),
      new Category(
          id: 5,
          name: "Small House",
          imageUrl:
              'https://pix10.agoda.net/hotelImages/2802499/0/70d86647af29727130e78aab404c0a65.jpg'),
    ];

    notifyListeners();
  }
}
