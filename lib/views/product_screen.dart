import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_product_app/controllers/product_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/constant.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(
      {super.key, required this.subCat, required this.subCatId});
  final String subCat;
  final String subCatId;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var productController = Get.put(ProductController())
      ..getProductsList(subCatId);
    double screenHeight = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(subCat),
        actions: [
          const SizedBox(width: 10),
          Container(
            height: 46,
            width: 46,
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.mic,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 46,
            width: 46,
            padding: const EdgeInsets.all(12),
            child: const Icon(
              FontAwesomeIcons.cartShopping,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     Expanded(
              //       child: TextFormField(
              //         decoration: InputDecoration(
              //             contentPadding: const EdgeInsets.symmetric(
              //                 horizontal: 14, vertical: 16),
              //             fillColor: Colors.white,
              //             filled: true,
              //             border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(24),
              //                 borderSide: BorderSide.none),
              //             hintText: "Search...",
              //             prefixIcon: const Icon(Icons.search)),
              //       ),
              //     ),
              //     const SizedBox(width: 10),
              //     Container(
              //       height: 46,
              //       width: 46,
              //       padding: const EdgeInsets.all(12),
              //       child: const Icon(
              //         Icons.mic,
              //         color: Colors.grey,
              //       ),
              //     ),
              //     const SizedBox(width: 10),
              //     Container(
              //       height: 46,
              //       width: 46,
              //       padding: const EdgeInsets.all(12),
              //       child: const Icon(
              //         FontAwesomeIcons.cartShopping,
              //         color: Colors.grey,
              //       ),
              //     ),
              //     const SizedBox(width: 5),
              //   ],
              // ),

              10.heightBox,
              GetBuilder<ProductController>(
                builder: (controller) {
                  if (controller.loading.value == true) {
                    return SizedBox(
                      height: Get.height * 0.6,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (controller.productList.isEmpty) {
                    return SizedBox(
                      height: Get.height * 0.8,
                      child: const Center(child: Text("No Data Found")),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                        mainAxisExtent: (screenHeight * 0.33),
                      ),
                      itemCount: controller.productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = controller.productList[index];
                        return Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    imageBaseUrl +
                                        data['single_image'].toString(),
                                    height: screenHeight * 0.2,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                3.heightBox,
                                Text(data['title'] ?? ""),
                                3.heightBox,
                                Row(
                                  children: [
                                    Text(
                                      "₹${data['selling_price'] ?? ""}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).expand(),
                                    Text(
                                      "₹${data['price'] ?? ""}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.black54),
                                    ).expand(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ).expand();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
