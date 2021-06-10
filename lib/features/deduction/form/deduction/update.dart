import 'package:app/core/form/textfield.dart';
import 'package:app/features/deduction/controller/deduction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DeductionUpdateForm extends StatelessWidget {
  const DeductionUpdateForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeductionController controller = Get.put(DeductionController());
    final coaForm = FormGroup({
      "active_status": FormControl(value: true),
      "created_by": FormControl<String>(value: 'admin'),
      "modified_by": FormControl<String>(value: 'admin'),
      "name": FormControl<String>(),
      "employee_deduction_list": FormControl<String>(),
      "amount": FormControl<String>(),
      "description": FormControl<String>(),
    });
    return Container(
      padding: EdgeInsets.all(10),
      child: ReactiveForm(
          formGroup: coaForm,
          child: Column(
            children: <Widget>[
              Text(
                'Update Deduction',
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
                hintText: 'employee_deduction_list',
                controlName: 'employee_deduction_list',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: 'amount',
                controlName: 'amount',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: 'employee_deduction_list',
                controlName: 'employee_deduction_list',
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 20),
              ReactiveFormConsumer(builder: (context, form, child) {
                return ElevatedButton(
                  onPressed: () async {
                    controller.createItem(form.value);
                    print('${form.value}');
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
