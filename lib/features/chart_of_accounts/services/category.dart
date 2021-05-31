import 'dart:convert';
import 'dart:developer';

import 'package:app/core/config/api.dart';
import 'package:app/core/crud/list.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:http/http.dart' as http;

class AccountCategoryService extends BaseCrudAPI {
  // static var client = http.Client();
  // var typesModel = AccountCategory;

  // static Future<AccountCategory> getList() async {
  //   var uri = Uri.https(APIURL.ACCOUNTING, 'api/account-category/');
  //   var modelList;
  //   try {
  //     var response = await client.get(uri);
  //     log('${response.statusCode}');
  //     if (response.statusCode == 200) {
  //       var jsonString = response.body;
  //       print(jsonString);
  //       var jsonMap = json.decode(jsonString);
  //       modelList = AccountCategory.fromJson(jsonMap);
  //     }
  //   } catch (Exception) {
  //     log('$Exception');
  //     log("Error occured");
  //     return modelList;
  //   }
  //   return modelList;
  // }

  @override
  Future getList(baseUrl, endpoint, modelSchema) {
    // TODO: implement getList
    return super.getList(baseUrl, endpoint, modelSchema);
  }
}
