import 'dart:convert';
import 'dart:developer';

import 'package:app/core/form/textfield.dart';
import 'package:app/features/chart_of_accounts/controller/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class COAUpdateForm extends StatelessWidget {
  COAUpdateForm({Key key}) : super(key: key);
  var name = Get.arguments[0] != null ? Get.arguments[0] : '';
  var description = Get.arguments[1] != null ? Get.arguments[1] : '';

  @override
  Widget build(BuildContext context) {
    COACategoryController controller = Get.put(COACategoryController());
    final coaForm = FormGroup({
      "active_status": FormControl(value: true),
      "created_by": FormControl<String>(value: 'admin'),
      "modified_by": FormControl<String>(value: 'admin'),
      "name": FormControl<dynamic>(
          // value: name,
          ),
      "description": FormControl<String>(
          // value: description,
          )
    });
    return Container(
      padding: EdgeInsets.all(10),
      child: ReactiveForm(
          formGroup: coaForm,
          child: Column(
            children: <Widget>[
              Text(
                'Update COA Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              MyTextField(
                hintText: 'name',
                controlName: 'name',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: 'description',
                controlName: 'description',
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 20),
              ReactiveFormConsumer(builder: (context, form, child) {
                return ElevatedButton(
                  onPressed: () async {
                    controller.updateItem(
                        form.value, controller.selectedId.value);
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
    );
  }
}
