import 'dart:developer';

import 'package:app/core/config/api.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:app/features/chart_of_accounts/services/category.dart';
import 'package:app/features/deduction/model/deduction.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class DeductionController extends GetxController {
  var endpoint = 'api/deduction/';
  var redirect = '/deduction';
  var isLoading = true.obs;
  var list = <DeductionResult>[].obs;
  var item = DeductionResult().obs;
  var selectedId = 0.obs;

  @override
  void onInit() {
    getList();
    super.onInit();
  }

  void getList() async {
    try {
      isLoading.value = true;
      var response = await AccountCategoryService()
          .getList(APIURL.ACCOUNTING, '$endpoint', deductionFromJson);
      print(response);
      if (response != null) {
        list.value = response.results;
      }
    } finally {
      isLoading.value = false;
    }
  }

  getItem(id) async {
    try {
      isLoading.value = true;
      var response = await AccountCategoryService()
          .getItem(APIURL.ACCOUNTING, '$endpoint$id', deductionResultFromJson);
      log(" the response on controller is $response");
      if (response != null) {
        item.value = response;
      }
      return response;
    } finally {
      isLoading.value = false;
    }
  }

  createItem(map) async {
    try {
      isLoading.value = true;
      var response = await AccountCategoryService().createItem(
        map,
        APIURL.ACCOUNTING,
        '$endpoint',
        deductionResultFromJson,
      );
      log(" the response on controller is $response");
      if (response != null) {
        item.value = response;
      }
      return response;
    } finally {
      isLoading.value = false;
      getList();
      Get.toNamed('$redirect');
    }
  }

  updateItem(map, id) async {
    try {
      isLoading.value = true;
      var response = await AccountCategoryService().updateItem(
          map, APIURL.ACCOUNTING, '$endpoint$id/', deductionResultFromJson);
      log(" the response on controller is $response");
      if (response != null) {
        // item.value = response;
        log('$response');
      }
      return response;
    } finally {
      isLoading.value = false;
      getList();
      Get.toNamed('$redirect');
    }
  }

  setSelectedId(id) async {
    selectedId.value = id;
  }
}
