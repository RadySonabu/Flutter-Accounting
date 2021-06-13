import 'dart:developer';

import 'package:app/features/app.dart';
import 'package:app/features/chart_of_accounts/controller/category.dart';
import 'package:app/features/chart_of_accounts/controller/title.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:app/features/chart_of_accounts/view/category/update.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class COATitleItem extends StatelessWidget {
  COATitleItem({Key key, this.item}) : super(key: key);
  final COATitleController controller = Get.put(COATitleController());

  final AccountsCategoryResult item;
  @override
  Widget build(BuildContext context) {
    return BasePage(
      pagetitle: 'Chart Title',
      content: FutureBuilder<dynamic>(
        future: controller.getItem(controller.selectedId),
        builder: (context, snapshot) {
          log('snapshot has data: ${snapshot.hasData}');
          if (snapshot.hasData == false) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Column(
                children: [
                  Text('this is the ${controller.item.value.titles}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('pressed');
                          Get.toNamed('/coa-title/update', arguments: [
                            controller.item.value.accountCategoryId,
                            controller.item.value.accountCode,
                            controller.item.value.titles,
                            controller.item.value.description
                          ]);
                        },
                        child: Text('Update'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.getList();
                          Get.toNamed('/coa-title');
                        },
                        child: Text('Cancel'),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
