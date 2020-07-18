import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//
import 'package:booking_place/src/constants/endpoints.dart';
import 'package:booking_place/src/models/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories {
    return _categories;
  }

  Future<void> getCategory() async {
    try {
      final url = '${Endpoints.categories}';
      final response = await http.get(url);
      var jsonResponse = json.decode(response.body);
      _categories = jsonResponse
          .map<Category>((item) => new Category.fromJson(item))
          .toList();
      if (jsonResponse == null) {
        return;
      }
    } catch (e) {
      throw e;
    }

//    _categories = [
//      new Category(
//          id: 1,
//          name: "Hotel",
//          imageUrl:
//              'https://pix10.agoda.net/hotelImages/124/1246280/1246280_16061017110043391702.jpg?s=1024x768'),
//      new Category(
//          id: 2,
//          name: "Motel",
//          imageUrl:
//              'https://r-cf.bstatic.com/images/hotel/max1024x768/148/148672944.jpg'),
//      new Category(
//          id: 3,
//          name: "Homestay",
//          imageUrl:
//              'https://www.hoteljob.vn/files/Anh-HTJ-Hong/homestay-la-gi-1.jpg'),
//      new Category(
//          id: 4,
//          name: "Villa",
//          imageUrl:
//              'https://q-xx.bstatic.com/xdata/images/hotel/840x460/171170838.jpg?k=61e429dc79a6ca574886d85e577d413adea5d4c9e6cf76dff15b9b7c1c60fcc7&amp;o='),
//      new Category(
//          id: 5,
//          name: "Small House",
//          imageUrl:
//              'https://pix10.agoda.net/hotelImages/2802499/0/70d86647af29727130e78aab404c0a65.jpg'),
//    ];

    notifyListeners();
  }
}
