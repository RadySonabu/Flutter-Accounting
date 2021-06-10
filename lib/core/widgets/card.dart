import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key key, this.content}) : super(key: key);
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Card();
  }
}
