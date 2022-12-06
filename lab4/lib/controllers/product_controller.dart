import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/services.dart';
import 'package:lab4/models/product_model.dart';
import 'dart:convert';

class ProductController extends GetxController {
  var listProduct = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await rootBundle.loadString('resources/json/shop.json');
    List products = await json.decode(response)["products"];

    if(products.isNotEmpty){
      for(Map<String,dynamic> i in products){
        listProduct.add(
            Product.fromJson(i)
        );
      }

      isLoading.value = false;
      update();
    } else{
      Get.snackbar('Error','Error Loading data!');
    }
  }
}