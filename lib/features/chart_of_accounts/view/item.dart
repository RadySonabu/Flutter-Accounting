import 'dart:developer';

import 'package:app/features/chart_of_accounts/controller/controller_chart_of_accounts.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:app/features/chart_of_accounts/view/update.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleContent extends StatelessWidget {
  SingleContent({Key key, this.item}) : super(key: key);
  final ChartOfAccountsController controller =
      Get.put(ChartOfAccountsController());

  final AccountsCategoryResult item;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<dynamic>(
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
                          Get.to(() => COAUpdate());
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
