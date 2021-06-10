import 'package:app/features/app.dart';
import 'package:app/features/deduction/form/deduction/create.dart';
import 'package:flutter/material.dart';

class DeductionCreatePage extends StatelessWidget {
  const DeductionCreatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        pagetitle: 'Deduction',
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DeductioCreateForm(),
        ));
  }
}
