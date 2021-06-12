import 'package:app/features/app.dart';
import 'package:app/features/deduction/form/deduction/create.dart';
import 'package:app/features/journal_entry/form/transaction_type/update.dart';
import 'package:flutter/material.dart';

class JournalTransactionTypeUpdatePage extends StatelessWidget {
  const JournalTransactionTypeUpdatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        pagetitle: 'Journal Transaction Type',
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: JournalEntryTransactionTypeUpdateForm(),
        ));
  }
}
