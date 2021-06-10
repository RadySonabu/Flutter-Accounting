import 'package:app/features/app.dart';
import 'package:app/features/chart_of_accounts/form/category_update_form.dart';
import 'package:app/features/deduction/form/deduction/update.dart';
import 'package:flutter/material.dart';

class DeductionUpdatePage extends StatelessWidget {
  const DeductionUpdatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pagetitle: 'Deduction',
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DeductionUpdateForm(),
      ),
    );
  }
}
