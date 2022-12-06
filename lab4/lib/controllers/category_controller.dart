import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/services.dart';
import 'package:lab4/models/category_model.dart';
import 'dart:convert';

class CategoryController extends GetxController {
  var listCategory = <Category>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final response = await rootBundle.loadString('resources/json/shop.json');
    List categories = await json.decode(response)["categories"];

    if(categories.isNotEmpty){
      for(Map<String,dynamic> i in categories){
        listCategory.add(
            Category.fromJson(i)
        );
      }

      isLoading.value = false;
      update();
    } else{
      Get.snackbar('Error','Error Loading data!');
    }
  }
}