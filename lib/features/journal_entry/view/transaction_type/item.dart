import 'dart:developer';

import 'package:app/features/app.dart';
import 'package:app/features/chart_of_accounts/controller/category.dart';
import 'package:app/features/chart_of_accounts/model/category.dart';
import 'package:app/features/chart_of_accounts/view/category/update.dart';
import 'package:app/features/deduction/controller/deduction.dart';
import 'package:app/features/journal_entry/controller/detail.dart';
import 'package:app/features/journal_entry/controller/transaction_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JournalTransactionTypeItemPage extends StatelessWidget {
  JournalTransactionTypeItemPage({Key key}) : super(key: key);
  final JETransactionTypeController controller =
      Get.put(JETransactionTypeController());

  @override
  Widget build(BuildContext context) {
    return new BasePage(
      pagetitle: 'Journal Transaction Type',
      content: Container(
        child: FutureBuilder<dynamic>(
          future: controller.getItem(controller.selectedId),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Column(
                  children: [
                    Text('this is the ${controller.item.value.name}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print('pressed');
                            Get.toNamed(
                              '/journal-transaction-type/update',
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
              );
            }
          },
        ),
      ),
    );
  }
}
