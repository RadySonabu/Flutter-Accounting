import 'package:app/features/app.dart';
import 'package:app/features/chart_of_accounts/form/title_create_form.dart';
import 'package:flutter/material.dart';

class COATitleCreate extends StatelessWidget {
  const COATitleCreate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: COATitleCreateForm(),
      ),
    );
  }
}
