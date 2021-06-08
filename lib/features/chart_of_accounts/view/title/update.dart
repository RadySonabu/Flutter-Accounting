import 'package:app/features/app.dart';
import 'package:app/features/chart_of_accounts/form/category_update_form.dart';
import 'package:app/features/chart_of_accounts/form/title_update_form.dart';
import 'package:flutter/material.dart';

class COATitleUpdate extends StatelessWidget {
  const COATitleUpdate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: COATitleUpdateForm(),
      ),
    );
  }
}
