import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key key, this.content}) : super(key: key);
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Payroll'),
          elevation: 0,
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: Text('Category'),
                onTap: () {
                  Get.toNamed('/coa-category');
                },
              ),
              ListTile(
                title: Text('Title'),
                onTap: () {
                  Get.toNamed('/coa-title');
                },
              ),
            ],
          ),
        ),
        body: Container(
          child: content,
        ),
      ),
    );
  }
}
