import 'package:app/features/app.dart';
import 'package:app/features/deduction/form/deduction_list/update.dart';
import 'package:app/features/deduction/form/employee_deduction/update.dart';
import 'package:flutter/material.dart';

class EmployeeDeductionUpdatePage extends StatelessWidget {
  const EmployeeDeductionUpdatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: EmployeeDeductionUpdateForm(),
      ),
    );
  }
}
