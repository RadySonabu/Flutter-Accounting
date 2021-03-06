import 'dart:developer';

import 'package:app/core/config/api.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:app/features/chart_of_accounts/services/category.dart';
import 'package:app/features/deduction/model/deduction.dart';
import 'package:app/features/deduction/model/deduction_list.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class DeductionListController extends GetxController {
  var endpoint = 'api/employee-deduction-list/';
  var redirect = '/deduction-type';
  var isLoading = true.obs;
  var list = <DeductionListResult>[].obs;
  var item = DeductionListResult().obs;
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
          .getList(APIURL.ACCOUNTING, '$endpoint', deductionListFromJson);
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
      var response = await AccountCategoryService().getItem(
          APIURL.ACCOUNTING, '$endpoint$id', deductionListResultFromJson);
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
        deductionListResultFromJson,
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
          map, APIURL.ACCOUNTING, '$endpoint$id/', deductionListResultFromJson);
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
