import 'package:app/features/chart_of_accounts/form/coa_update.dart';
import 'package:flutter/material.dart';

class COAUpdate extends StatelessWidget {
  const COAUpdate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(resizeToAvoidBottomInset: false, body: COAUpdateForm()),
    );
  }
}
