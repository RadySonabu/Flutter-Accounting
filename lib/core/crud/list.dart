import 'dart:convert';
import 'dart:developer';

import 'package:app/core/config/api.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:http/http.dart' as http;

class BaseCrudAPI {
  var client = http.Client();

  Future<dynamic> getList(baseUrl, endpoint, modelSchema) async {
    var uri = Uri.https(baseUrl, endpoint);
    var modelList;
    try {
      var response = await client.get(uri);
      log('${response.statusCode}');
      if (response.statusCode == 200) {
        // var jsonString = response.body;
        // print(jsonString);
        // var jsonMap = json.decode(jsonString);
        // // modelList = AccountCategory.fromJson(jsonMap);
        // AccountCategory model = new AccountCategory.fromJson(jsonMap);

        // modelList = AccountCategory.fromJson(jsonMap);
        modelList = modelSchema(response.body);
      }
    } catch (Exception) {
      log('$Exception');
      log("Error occured");
      return modelList;
    }
    return modelList;
  }
}
