import 'package:app/features/app.dart';
import 'package:app/features/chart_of_accounts/controller/category.dart';
import 'package:app/features/chart_of_accounts/form/category_create_form.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class COACategoryCreate extends StatelessWidget {
  const COACategoryCreate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        pagetitle: 'Chart Category',
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: COACategoryCreateForm(),
        ));
  }
}
