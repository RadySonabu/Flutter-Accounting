import 'dart:developer';

import 'package:app/features/chart_of_accounts/controller/controller_chart_of_accounts.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleContent extends StatelessWidget {
  SingleContent({Key key}) : super(key: key);
  final ChartOfAccountsController controller =
      Get.put(ChartOfAccountsController());

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var editingController;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        log('$value');
                      },
                      controller: editingController,
                      decoration: InputDecoration(
                          labelText: "this is the new",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Obx(() => Center(
                    child: Text('this is the ${controller.item.value.name}')))),
          ],
        ),
      ),
    );
  }
}
