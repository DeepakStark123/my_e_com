import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_product_app/controllers/home_controller.dart';
import 'package:my_product_app/views/product_screen.dart';
import 'package:my_product_app/views/search_products.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_product_app/utils/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: homeController.searchController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 16),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide.none),
                          hintText: "Search...",
                          prefixIcon: IconButton(
                              onPressed: () {
                                if (homeController
                                    .searchController.text.isNotEmpty) {
                                  Get.to(
                                    () => SearchProductScreen(
                                        productName: homeController
                                            .searchController.text),
                                  );
                                }
                              },
                              icon: const Icon(Icons.search))),
                    ),
                  ),
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
              10.heightBox,
              GetBuilder<HomeController>(
                builder: (controller) {
                  if (controller.loading.value == true) {
                    return SizedBox(
                      height: Get.height * 0.6,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return GridView.builder(
                      // maxCrossAxisExtent: 200.0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                        mainAxisExtent: 180,
                      ),
                      itemCount: controller.subCatList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = controller.subCatList[index];
                        return Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                imageBaseUrl + data.image.toString(),
                                fit: BoxFit.fill,
                              ),
                              2.heightBox,
                              Text(data.name ?? "")
                            ],
                          ),
                        ).onTap(() {
                          Get.to(ProductScreen(
                            subCat: data.name ?? "",
                            subCatId: data.id ?? "",
                          ));
                        });
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
