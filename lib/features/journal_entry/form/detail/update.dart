import 'package:app/core/form/textfield.dart';
import 'package:app/features/deduction/controller/deduction.dart';
import 'package:app/features/journal_entry/controller/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class JournalEntryDetailsUpdateForm extends StatelessWidget {
  const JournalEntryDetailsUpdateForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JEDetailController controller = Get.put(JEDetailController());
    final coaForm = FormGroup({
      "active_status": FormControl(value: true),
      "created_by": FormControl<String>(value: 'admin'),
      "modified_by": FormControl<String>(value: 'admin'),
      "entry_number": FormControl<String>(),
      "account_code_id": FormControl<String>(),
      "transaction_type": FormControl<String>(),
      "transaction_amount": FormControl<String>(),
    });
    return Container(
      padding: EdgeInsets.all(10),
      child: ReactiveForm(
          formGroup: coaForm,
          child: Column(
            children: <Widget>[
              Text(
                'Update Journal Entry Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              MyTextField(
                hintText: 'entry_number',
                controlName: 'entry_number',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: 'account_code_id',
                controlName: 'account_code_id',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: 'transaction_type',
                controlName: 'transaction_type',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: 'transaction_amount',
                controlName: 'transaction_amount',
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
