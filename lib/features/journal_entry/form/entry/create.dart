import 'package:app/core/form/textfield.dart';
import 'package:app/features/deduction/controller/deduction.dart';
import 'package:app/features/journal_entry/controller/entry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class JournalEntryCreateForm extends StatelessWidget {
  const JournalEntryCreateForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JEEntryController controller = Get.put(JEEntryController());
    final coaForm = FormGroup({
      "active_status": FormControl(value: true),
      "created_by": FormControl<String>(value: 'admin'),
      "modified_by": FormControl<String>(value: 'admin'),
      "entry_number": FormControl<String>(),
      "entry_user": FormControl<String>()
    });
    return Container(
      padding: EdgeInsets.all(10),
      child: ReactiveForm(
          formGroup: coaForm,
          child: Column(
            children: <Widget>[
              Text(
                'Create Journal Entry',
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
                hintText: 'entry_user',
                controlName: 'entry_user',
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
