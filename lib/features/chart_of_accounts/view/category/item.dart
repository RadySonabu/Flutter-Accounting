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
                        Text('NAME: ${controller.item.value.name}'),
                        SizedBox(height: 20),
                        Text(
                            'DESCRIPTION: ${controller.item.value.description}'),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print('pressed');
                                Get.toNamed('/coa-category/update', arguments: [
                                  controller.item.value.name,
                                  controller.item.value.description
                                ]);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                              ),
                              child: Text('Update'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                Get.toNamed('/coa-category');
                              },
                              style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                              ),
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
