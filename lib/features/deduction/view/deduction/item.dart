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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ID: ${controller.item.value.id}'),
                        Text('NAME: ${controller.item.value.name}'),
                        Text(
                            'EMPLOYEE DEDUCTION LIST ID: ${controller.item.value.employeeDeductionList}'),
                        Text('AMOUNT: ${controller.item.value.amount}'),
                        Text(
                            'DESCRIPTION: ${controller.item.value.description}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print('pressed');
                                Get.toNamed(
                                  '/deduction/update',
                                );
                              },
                              child: Text('Update'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('Cancel'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
