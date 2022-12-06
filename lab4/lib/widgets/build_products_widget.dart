import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab4/controllers/product_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class BuildProducts extends StatelessWidget {
  const BuildProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return Scaffold(
      body: Obx(
              () => controller.isLoading.value
              ? const Center(
                child: CircularProgressIndicator(),
              )
              : GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 28,
                    crossAxisCount: 2,
                    mainAxisExtent: 326,

                  ),
                  itemCount: controller.listProduct.length,
                  itemBuilder: (context, index){
                    final product = controller.listProduct[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                product.cover ?? 'Product cover',
                                height: 240,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Positioned(
                              right: 8,
                              top: 8,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  onPressed: (){},
                                  icon: SvgPicture.asset(
                                    'resources/svg/star.svg',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          product.title ?? 'Product title',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          product.subTitle ?? 'Product subtitle',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF929292),
                          ),
                        ),
                        //const Spacer(),
                        Text(
                          '${product.currency} ${product.price}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF00C569),
                          ),
                        ),
                      ],
                    );
                  }
              )
      ),
    );
  }
}