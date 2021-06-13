import 'package:app/core/form/textfield.dart';
import 'package:app/features/deduction/controller/deduction_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CollectionDeductioCreateForm extends StatelessWidget {
  const CollectionDeductioCreateForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeductionListController controller = Get.put(DeductionListController());
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
                'Create Deduction Type',
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
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
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
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text('Cancel'),
                    ),
                  ],
                );
              })
            ],
          )),
    );
  }
}
