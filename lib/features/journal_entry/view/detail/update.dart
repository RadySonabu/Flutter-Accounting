import 'package:app/features/app.dart';
import 'package:app/features/deduction/form/deduction/create.dart';
import 'package:app/features/journal_entry/form/detail/update.dart';
import 'package:flutter/material.dart';

class JournalDetailUpdatePage extends StatelessWidget {
  const JournalDetailUpdatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        pagetitle: 'Journal Detail',
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(child: JournalEntryDetailsUpdateForm()),
        ));
  }
}
