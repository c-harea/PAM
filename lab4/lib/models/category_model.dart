import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

//https://javiercbk.github.io/json_to_dart/
class Category {
  String? title;
  String? icon;

  //constructor
  Category({this.title, this.icon});

  //extragerea datelor din JSON
  Category.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
  }
}