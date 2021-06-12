import 'package:app/core/form/textfield.dart';
import 'package:app/features/deduction/controller/deduction.dart';
import 'package:app/features/journal_entry/controller/transaction_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class JournalEntryTransactionTypeUpdateForm extends StatelessWidget {
  const JournalEntryTransactionTypeUpdateForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JETransactionTypeController controller =
        Get.put(JETransactionTypeController());
    final coaForm = FormGroup({
      "active_status": FormControl(value: true),
      "created_by": FormControl<String>(value: 'admin'),
      "modified_by": FormControl<String>(value: 'admin'),
      "name": FormControl<dynamic>(
          // value: name,
          ),
    });
    return Container(
      padding: EdgeInsets.all(10),
      child: ReactiveForm(
          formGroup: coaForm,
          child: Column(
            children: <Widget>[
              Text(
                'Update Journal Entry Transaction Type',
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
                  child: Text('Update'),
                );
              })
            ],
          )),
    );
  }
}
