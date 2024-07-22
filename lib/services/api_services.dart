import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class ApiServices {
  static Dio dio = Dio();

  static Future<List<Product>> fetchProducts() async {
    try {
      var response = await dio.get("https://fakestoreapi.com/products/");

      debugPrint(response.toString());
      if (response.statusCode == 200) {
        final List<dynamic> body = response.data;
        return body.map((product) => Product.fromJson(product)).toList();
      } else {
        debugPrint(response.statusCode.toString());
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
