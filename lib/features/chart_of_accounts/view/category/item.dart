import 'dart:developer';

import 'package:app/features/app.dart';
import 'package:app/features/chart_of_accounts/controller/category.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:app/features/chart_of_accounts/view/category/update.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleContent extends StatelessWidget {
  SingleContent({Key key}) : super(key: key);
  final COACategoryController controller = Get.put(COACategoryController());

  // final AccountsCategoryResult item;
  @override
  Widget build(BuildContext context) {
    return new BasePage(
      pagetitle: 'Chart Category',
      content: Container(
        child: FutureBuilder<dynamic>(
          future: controller.getItem(controller.selectedId),
          builder: (context, snapshot) {
            log('snapshat has ${controller.isLoading.value}');
            log('controller ${controller.getItem(controller.selectedId)}');
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Column(
                  children: [
                    Text('this is the ${controller.item.value.name}'),
                    ElevatedButton(
                        onPressed: () {
                          print('pressed');
                          Get.toNamed('/coa-category/update', arguments: [
                            controller.item.value.name,
                            controller.item.value.description
                          ]);
                        },
                        child: Text('Update'))
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
