import 'package:app/features/app.dart';
import 'package:app/features/deduction/controller/employee_deduction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeDeductionItemPage extends StatelessWidget {
  EmployeeDeductionItemPage({Key key}) : super(key: key);
  final EmployeeDeductionController controller =
      Get.put(EmployeeDeductionController());

  @override
  Widget build(BuildContext context) {
    return new BasePage(
      pagetitle: 'Employee Deduction',
      content: Container(
        child: FutureBuilder<dynamic>(
          future: controller.getItem(controller.selectedId),
          builder: (context, snapshot) {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Column(
                  children: [
                    Text('this is the ${controller.item.value.employeeId}'),
                    ElevatedButton(
                        onPressed: () {
                          print('pressed');
                          // Get.toNamed('/coa-category/update', arguments: [
                          //   controller.item.value.name,
                          //   controller.item.value.description
                          // ]);
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
