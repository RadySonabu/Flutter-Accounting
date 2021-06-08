import 'dart:developer';

import 'package:app/core/config/api.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:app/features/chart_of_accounts/model/title.dart';
import 'package:app/features/chart_of_accounts/services/category.dart';
import 'package:app/features/chart_of_accounts/services/title.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class COATitleController extends GetxController {
  // * URL
  var endpoint = 'api/account-titles';

  var isLoading = true.obs;
  var list = <AccountsTitleResult>[].obs;
  var item = AccountsTitleResult().obs;
  var selectedId = 0.obs;
  // var id = 0.obs;
  // var item = <AccountsCategoryResult>[].obs;
  @override
  void onInit() {
    getList();
    super.onInit();
  }

  void getList() async {
    try {
      isLoading.value = true;
      var response = await AccountTitleService()
          .getList(APIURL.ACCOUNTING, '$endpoint', accountTitleFromJson);
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
      var response = await AccountTitleService().getItem(
          APIURL.ACCOUNTING, '$endpoint/$id', accountsTitleResultFromJson);
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
        accountsCategoryResultFromJson,
      );
      log(" the response on controller is $response");
      if (response != null) {
        item.value = response;
      }
      return response;
    } finally {
      isLoading.value = false;
    }
  }

  updateItem(map, id) async {
    try {
      isLoading.value = true;
      var response = await AccountTitleService().updateItem(map,
          APIURL.ACCOUNTING, '$endpoint/$id/', accountsTitleResultFromJson);
      log(" the response on controller is $response");
      if (response != null) {
        // item.value = response;
        log('$response');
      }
      return response;
    } finally {
      isLoading.value = false;
    }
  }

  setSelectedId(id) async {
    selectedId.value = id;
  }
}
