import 'package:app/features/app.dart';
import 'package:app/features/deduction/form/deduction/create.dart';
import 'package:flutter/material.dart';

class JournalTransactionTypeCreatePage extends StatelessWidget {
  const JournalTransactionTypeCreatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        pagetitle: 'Journal Transaction Type',
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DeductioCreateForm(),
        ));
  }
}
