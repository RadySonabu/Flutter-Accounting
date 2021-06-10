import 'package:app/features/app.dart';
import 'package:app/features/deduction/form/deduction_list/update.dart';
import 'package:flutter/material.dart';

class DeductionTypeUpdatePage extends StatelessWidget {
  const DeductionTypeUpdatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pagetitle: 'Deduction Type',
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DeductionTypeUpdateForm(),
      ),
    );
  }
}
