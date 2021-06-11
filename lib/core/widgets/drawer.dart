import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Center(child: Text('Drawer Header')),
          ),
          ExpansionTile(
            childrenPadding: EdgeInsets.only(left: 40),
            initiallyExpanded: true,
            title: Text("Charts of Accounts"),
            children: <Widget>[
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
          ExpansionTile(
            childrenPadding: EdgeInsets.only(left: 40),
            initiallyExpanded: true,
            title: Text("Deductions"),
            children: <Widget>[
              ListTile(
                title: Text('Deduction '),
                onTap: () {
                  Get.toNamed('/deduction');
                },
              ),
              ListTile(
                title: Text('Deduction Type'),
                onTap: () {
                  Get.toNamed('/deduction-type');
                },
              ),
              ListTile(
                title: Text('Employee Deduction'),
                onTap: () {
                  Get.toNamed('/deduction-employee');
                },
              ),
            ],
          ),
          ExpansionTile(
            childrenPadding: EdgeInsets.only(left: 40),
            initiallyExpanded: true,
            title: Text("Journal Entry"),
            children: <Widget>[
              ListTile(
                title: Text('Detail'),
                onTap: () {
                  Get.toNamed('/journal-detail');
                },
              ),
              ListTile(
                title: Text('Transaction Type'),
                onTap: () {
                  Get.toNamed('/journal-transaction-type');
                },
              ),
              ListTile(
                title: Text('Entry'),
                onTap: () {
                  Get.toNamed('/journal-entry');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
