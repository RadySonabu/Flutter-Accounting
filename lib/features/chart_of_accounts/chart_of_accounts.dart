import 'package:app/features/app.dart';
import 'package:app/features/chart_of_accounts/view/category/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartOfAccountsPage extends StatelessWidget {
  const ChartOfAccountsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/coa-category');
                },
                child: Text('Category')),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/coa-title');
                },
                child: Text('Title')),
          ],
        ),
        // child: Text('asdf'),
      ),
    );
  }
}
