import 'package:app/features/app.dart';
import 'package:app/features/chart_of_accounts/form/category_update_form.dart';
import 'package:flutter/material.dart';

class COAUpdate extends StatelessWidget {
  const COAUpdate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pagetitle: 'Chart Category',
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: COAUpdateForm(),
      ),
    );
  }
}
