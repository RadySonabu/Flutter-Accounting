import 'dart:developer';

import 'package:app/core/config/api.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:app/features/chart_of_accounts/services/category.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ChartOfAccountsController extends GetxController {
  var isLoading = true.obs;
  var list = <AccountsCategoryResult>[].obs;
  var item = AccountsCategoryResult().obs;
  @override
  void onInit() {
    getList();
    super.onInit();
  }

  void setItem(id) async {
    item = id;
  }

  void getList() async {
    try {
      isLoading.value = true;
      // var response = await AccountCategoryService.getList();
      var response = await AccountCategoryService().getList(
          APIURL.ACCOUNTING, 'api/account-category', accountCategoryFromJson);
      if (response != null) {
        list.value = response.results;
      }
    } finally {
      isLoading.value = false;
    }
  }
}