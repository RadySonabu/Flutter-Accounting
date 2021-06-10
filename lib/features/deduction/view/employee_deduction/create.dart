import 'package:app/features/app.dart';
import 'package:app/features/deduction/form/deduction/create.dart';
import 'package:app/features/deduction/form/employee_deduction/create.dart';
import 'package:flutter/material.dart';

class EmployeeDeductionCreatePage extends StatelessWidget {
  const EmployeeDeductionCreatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        pagetitle: 'Employee Deduction',
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: EmployeeDeductioCreateForm(),
        ));
  }
}
