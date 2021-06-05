import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key key, this.controlName, this.hintText})
      : super(key: key);
  final String controlName;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: controlName,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Color(0xFFDBEDFF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
