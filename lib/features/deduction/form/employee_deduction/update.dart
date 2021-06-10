import 'package:app/core/form/textfield.dart';
import 'package:app/features/deduction/controller/employee_deduction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EmployeeDeductionUpdateForm extends StatelessWidget {
  const EmployeeDeductionUpdateForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmployeeDeductionController controller =
        Get.put(EmployeeDeductionController());
    final coaForm = FormGroup({
      "active_status": FormControl(value: true),
      "created_by": FormControl<String>(value: 'admin'),
      "modified_by": FormControl<String>(value: 'admin'),
      "employee_id": FormControl<dynamic>(),
      "deduction": FormControl<String>()
    });
    return Container(
      padding: EdgeInsets.all(10),
      child: ReactiveForm(
          formGroup: coaForm,
          child: Column(
            children: <Widget>[
              Text(
                'Create Collection of Deduction',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              MyTextField(
                hintText: 'Employee ID',
                controlName: 'employee_id',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: 'deduction',
                controlName: 'deduction',
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
