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
      // log('${response.statusCode}');
      if (response.statusCode == 200) {
        modelList = modelSchema(response.body);
      }
    } catch (Exception) {
      log('$Exception');
      log("Error occured");
      return modelList;
    }
    return modelList;
  }

  Future<dynamic> getItem(baseUrl, endpoint, modelSchema) async {
    var uri = Uri.https(baseUrl, endpoint);
    var modelItem;
    try {
      var response = await client.get(uri);
      // log('${response.statusCode}');
      if (response.statusCode == 200) {
        modelItem = modelSchema(response.body);
        // var jsonString = response.body;
        // print(jsonString);
        // var jsonMap = json.decode(jsonString);
        // modelList = AccountsCategoryResult.fromJson(jsonMap);
      }
    } catch (Exception) {
      log('$Exception');
      log("Error occured");
      return modelItem;
    }
    return modelItem;
  }

  Future<dynamic> updateItem(
      Map request, baseUrl, endpoint, modelSchema) async {
    var headers = {'Content-Type': 'application/json'};
    var uri = Uri.https(baseUrl, endpoint);

    var modelList;
    try {
      var response = await http.put(
        uri,
        headers: headers,
        body: json.encode(request),
      );
      log('${response.statusCode}');
      log('${response.reasonPhrase}');
      if (response.statusCode == 200) {
        // modelList = modelSchema(response.body);
        // return modelSchema(response.body);
        log('gumana');
      }
    } catch (Exception) {
      log('$Exception');
      log("Error occured");
      return modelList;
    }
    return modelList;
  }

  Future<dynamic> createItem(
      Map request, baseUrl, endpoint, modelSchema) async {
    var headers = {'Content-Type': 'application/json'};
    var uri = Uri.https(baseUrl, endpoint);

    var modelList;
    try {
      var response = await http.post(
        uri,
        headers: headers,
        body: json.encode(request),
      );
      log('${response.statusCode}');
      log('${response.reasonPhrase}');
      if (response.statusCode == 200) {
        // modelList = modelSchema(response.body);
        // return modelSchema(response.body);
        log('gumana');
      }
    } catch (Exception) {
      log('$Exception');
      log("Error occured");
      return modelList;
    }
    return modelList;
  }
}
