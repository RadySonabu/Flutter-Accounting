import 'package:app/core/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key key, this.content, this.pagetitle}) : super(key: key);
  final Widget content;
  final String pagetitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Payroll'),
          elevation: 0,
        ),
        drawer: MyDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '$pagetitle',
                textAlign: TextAlign.left,
                textScaleFactor: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Payrool / $pagetitle'),
            ),
            Expanded(child: content != null ? content : Container()),
          ],
        ),
      ),
    );
  }
}
