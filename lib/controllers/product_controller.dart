import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:my_product_app/utils/constant.dart';

class ProductController extends GetxController {
  var loading = false.obs;
  // var productList = <Product>[].obs;
  List<dynamic> productList = [];
  List<dynamic> serachProduct = [];
  //-----get-sub-category-list----
  getProductsList(String subCatId) async {
    loading(true);
    try {
      var res = await http.post(
        Uri.parse('${productBaseUrl}customer/get-product'),
        body: {
          "main_category": "1",
          "subcategory": subCatId,
        },
      );

      if (res.statusCode == 200) {
        // debugPrint("Product list = ${res.body}");
        //   GetProductListModel mapRes =
        //       getProductListModelFromJson(res.body.toString());
        //   var data = mapRes.data;
        //   productList.clear();
        //   productList.addAll(data!.products as Iterable<Product>);
        // }
        serachProduct.clear();
        Map mapResponse = jsonDecode(res.body.toString());
        productList.addAll(mapResponse['data']['products']);
        debugPrint("search product list length = ${productList.length}");
        debugPrint("search product list = $productList");
        update();
      }
    } catch (e) {
      debugPrint("Exception =$e");
    } finally {
      loading(false);
    }
    update();
  }

  //-----get-sub-category-list----
  searchProductsList(String itemName) async {
    loading(true);
    try {
      debugPrint(itemName);
      final res = await http.post(
        Uri.parse('${productBaseUrl}customer/get-product'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'header_search': itemName,
        }),
      );

      if (res.statusCode == 200) {
        // debugPrint("search list = ${res.body}");
        serachProduct.clear();
        Map mapResponse = jsonDecode(res.body.toString());
        serachProduct.addAll(mapResponse['data']['products']);
        debugPrint("search product list length = ${serachProduct.length}");

        debugPrint("search product list = $serachProduct");
        update();
      }
    } catch (e) {
      debugPrint("Exception =$e");
    } finally {
      loading(false);
    }
    update();
  }
}
