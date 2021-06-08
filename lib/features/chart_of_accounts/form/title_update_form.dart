import 'dart:convert';
import 'dart:developer';

import 'package:app/core/form/textfield.dart';
import 'package:app/features/chart_of_accounts/controller/category.dart';
import 'package:app/features/chart_of_accounts/controller/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class COATitleUpdateForm extends StatelessWidget {
  COATitleUpdateForm({Key key}) : super(key: key);

  final coaForm = FormGroup({
    "active_status": FormControl(value: true),
    "created_by": FormControl<String>(value: 'admin'),
    "modified_by": FormControl<String>(value: 'admin'),
    "account_category_id": FormControl(),
    "account_code": FormControl<String>(),
    "titles": FormControl<String>(),
    "description": FormControl<String>()
  });

  @override
  Widget build(BuildContext context) {
    COATitleController controller = Get.put(COATitleController());
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: ReactiveForm(
            formGroup: coaForm,
            child: Column(
              children: <Widget>[
                Text(
                  'COA Title Creation',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 30),
                MyTextField(
                  hintText: 'account_category_id',
                  controlName: 'account_category_id',
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  hintText: 'account_code',
                  controlName: 'account_code',
                ),
                SizedBox(height: 30),
                MyTextField(
                  hintText: 'titles',
                  controlName: 'titles',
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  hintText: 'description',
                  controlName: 'description',
                ),
                SizedBox(height: 20),
                ReactiveFormConsumer(builder: (context, form, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      // print('asdf');
                      // controller.updateItem(
                      //     form.value, controller.selectedId.value);
                      // print(
                      //     'the value passed to controller is: ${json.encode(form.value)}');
                      // print('the value passed to controller is: ${form.value}');
                      // Get.offAllNamed('/vehicle-inventory/new-application');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text('Submit'),
                  );
                })
              ],
            )),
      ),
    );
  }
}
