import 'dart:developer';

import 'package:app/features/app.dart';
import 'package:app/features/chart_of_accounts/controller/category.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:app/features/chart_of_accounts/view/category/update.dart';
import 'package:app/features/deduction/controller/deduction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeductionItemPage extends StatelessWidget {
  DeductionItemPage({Key key}) : super(key: key);
  final DeductionController controller = Get.put(DeductionController());

  @override
  Widget build(BuildContext context) {
    return new BasePage(
      pagetitle: 'Deduction',
      content: Container(
        child: FutureBuilder<dynamic>(
          future: controller.getItem(controller.selectedId),
          builder: (context, snapshot) {
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
                          Get.toNamed(
                            '/deduction/update',
                          );
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
