import 'package:app/features/app.dart';
import 'package:app/features/deduction/form/deduction/create.dart';
import 'package:app/features/deduction/form/deduction_list/create.dart';
import 'package:flutter/material.dart';

class DeductionCollectionCreatePage extends StatelessWidget {
  const DeductionCollectionCreatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
        pagetitle: 'Deduction Type',
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CollectionDeductioCreateForm(),
        ));
  }
}
