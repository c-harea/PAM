import 'package:lab4/controllers/category_controller.dart';
import 'package:lab4/controllers/product_controller.dart';
import 'package:get/instance_manager.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController());
    Get.put<ProductController>(ProductController());
  }
}