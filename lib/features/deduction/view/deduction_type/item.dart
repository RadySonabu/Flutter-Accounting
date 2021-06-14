import 'package:app/features/app.dart';
import 'package:app/features/deduction/controller/deduction_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeductionTypeItemPage extends StatelessWidget {
  DeductionTypeItemPage({Key key}) : super(key: key);
  final DeductionListController controller = Get.put(DeductionListController());

  @override
  Widget build(BuildContext context) {
    return new BasePage(
      pagetitle: 'Deduction Type',
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
                        Text('NAME: ${controller.item.value.name}'),
                        Text(
                            'DESCRIPTION: ${controller.item.value.description}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print('pressed');
                                Get.toNamed('/deduction-type/update');
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
