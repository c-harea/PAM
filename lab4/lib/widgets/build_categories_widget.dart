import 'package:flutter/material.dart';
import 'package:lab4/controllers/category_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class BuildCategories extends StatelessWidget {
  const BuildCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();

    return Scaffold(
      body: Obx(
          () => controller.isLoading.value
              ? const Center(
                child: CircularProgressIndicator(),
              )
              : ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.listCategory.length,
                itemBuilder: (context, index){
                  final category = controller.listCategory[index];
                  return Card(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(blurRadius: 5, color: Color(0x00F4F4F4), spreadRadius: 2)],
                          ),
                          child: Image.network(
                            category.icon ?? "Image",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: Text(
                            category.title ?? 'Title',
                            style: const TextStyle(
                                fontSize: 12
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }, separatorBuilder: (context, index) => const SizedBox(
                width: 18,
              ),
              )
      ),
    );
  }
}