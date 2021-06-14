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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ID: ${controller.item.value.id}'),
                        Text(
                            'EMPLOYEE ID: ${controller.item.value.employeeId}'),
                        Text('DEDUCTION: ${controller.item.value.deduction}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                print('pressed');
                                Get.toNamed('/deduction-employee/update');
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
