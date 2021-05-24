import 'package:app/features/chart_of_accounts/view/chart_of_accounts_content.dart';
import 'package:flutter/material.dart';

class ChartOfAccountsPage extends StatelessWidget {
  const ChartOfAccountsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ChartContent(),
        ),
      ),
    );
  }
}
