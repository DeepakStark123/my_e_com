import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import '../models/sub_category_model.dart';
import '../utils/constant.dart';

class HomeController extends GetxController {
  var loading = false.obs;
  var subCatList = <Datum>[].obs;
  TextEditingController searchController = TextEditingController();

  //-----get-sub-category-list----
  getSubCatProducts() async {
    loading(true);
    try {
      var res = await http.post(
        Uri.parse('${productBaseUrl}customer/get-sub-category-with-brand'),
        body: {
          'category_id': "1",
        },
      );

      if (res.statusCode == 200) {
        // debugPrint(res.body);
        GetSubCategoryModel mapRes =
            getSubCategoryModelFromJson(res.body.toString());
        var data = mapRes.data;
        subCatList.clear();
        subCatList.addAll(data ?? []);
      }
      update();
    } catch (e) {
      debugPrint("Exception =$e");
    } finally {
      loading(false);
    }
    update();
  }

  @override
  void onInit() {
    getSubCatProducts();
    super.onInit();
  }
}
