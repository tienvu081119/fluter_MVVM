
import 'dart:convert';

import 'package:app_ui_03/models/products.dart';
import 'package:flutter/services.dart';

class ProductsRepository {
  Future<List<Products>> fetchProducts() async {
    List<Products> products = [];
    dynamic data = await rootBundle.loadString('assets/data/products.json');
    var jsons = await jsonDecode(data);

     for (var json in jsons) {
       products.add(Products.fromJson(json));
     }
    return products;
  }
}