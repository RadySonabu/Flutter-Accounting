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
                          Get.toNamed('/deduction-type/update');
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
