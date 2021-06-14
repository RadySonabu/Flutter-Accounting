import 'dart:developer';

import 'package:app/features/app.dart';
import 'package:app/features/chart_of_accounts/controller/category.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:app/features/chart_of_accounts/view/category/update.dart';
import 'package:app/features/deduction/controller/deduction.dart';
import 'package:app/features/journal_entry/controller/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JournalDetailsItemPage extends StatelessWidget {
  JournalDetailsItemPage({Key key}) : super(key: key);
  final JEDetailController controller = Get.put(JEDetailController());

  @override
  Widget build(BuildContext context) {
    return new BasePage(
      pagetitle: 'Journal Details',
      content: Container(
        child: FutureBuilder<dynamic>(
          future: controller.getItem(controller.selectedId),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
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
                        Text(
                            'ENTRY NUMBER: ${controller.item.value.entryNumber}'),
                        Text(
                            'ACCOUNT CODE: ${controller.item.value.accountCodeId}'),
                        Text(
                            'TRANSACTION TYPE: ${controller.item.value.transactionType}'),
                        Text(
                            'TRANSACTION AMOUNT: ${controller.item.value.transactionAmount}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print('pressed');
                                Get.toNamed(
                                  '/journal-detail/update',
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
