import 'dart:convert';
import 'dart:developer';

import 'package:app/core/form/textfield.dart';
import 'package:app/features/chart_of_accounts/controller/controller_chart_of_accounts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class COAUpdateForm extends StatelessWidget {
  COAUpdateForm({Key key}) : super(key: key);
  // var list_item = ['vehicle_origination', 'owner', 'build_id', 'modified_by'];
  // var mapForm = {
  //   "active_status": FormControl(),
  //   "created_by": FormControl(),
  //   "modified_by": FormControl(),
  //   "name": FormControl(),
  //   "description": FormControl()
  // };
  final coaForm = FormGroup({
    "active_status": FormControl(),
    "created_by": FormControl<String>(),
    "modified_by": FormControl<String>(),
    "name": FormControl<String>(),
    "description": FormControl<String>()
  });

  @override
  Widget build(BuildContext context) {
    ChartOfAccountsController controller = Get.put(ChartOfAccountsController());
    return Container(
      child: ReactiveForm(
          formGroup: coaForm,
          child: Column(
            children: <Widget>[
              Text(
                'Master Info Registration',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              ReactiveTextField(
                formControlName: 'name',
                decoration: InputDecoration(
                  hintText: 'name',
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
              MyTextField(
                hintText: 'modified_by',
                controlName: 'modified_by',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: 'created_by',
                controlName: 'created_by',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: 'active_status',
                controlName: 'active_status',
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 20),
              ReactiveFormConsumer(builder: (context, form, child) {
                return ElevatedButton(
                  onPressed: () async {
                    // print('asdf');
                    controller.updateItem(
                        form.value, controller.selectedId.value);
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
    );
  }
}
