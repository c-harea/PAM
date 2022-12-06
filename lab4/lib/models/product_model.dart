import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

//https://javiercbk.github.io/json_to_dart/
class Product {
  String? cover;
  String? title;
  String? subTitle;
  String? price;
  String? currency;

  //constructor
  Product({this.cover, this.title, this.subTitle, this.price, this.currency});

  //extragerea datelor din JSON
  Product.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    title = json['title'];
    subTitle = json['sub_title'];
    price = json['price'];
    currency = json['currency'];
  }
}