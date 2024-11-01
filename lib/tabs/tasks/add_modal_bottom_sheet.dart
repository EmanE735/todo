import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/widgets/defult_elevated_button.dart';
import 'package:todo/widgets/defult_text_form_filed.dart';
import 'package:todo/widgets/firebase_function.dart';

class AddModalBottomSheet extends StatefulWidget {
  const AddModalBottomSheet({super.key});

  @override
  State<AddModalBottomSheet> createState() => _AddModalBottomSheetState();
}

class _AddModalBottomSheetState extends State<AddModalBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.55,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Add New task",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            DefultTextFormField(
              controller: titleController,
              hintText: "enter task title",
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'title can not be empty';
                }
                return null;
              },
            ),
            SizedBox(
              height: 16,
            ),
            DefultTextFormField(
              controller: descriptionController,
              hintText: "enter task description",
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'description can not be empty';
                }
                return null;
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Select date",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppTheme.black, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                DateTime? dateTime = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                    initialDate: selectedDate,
                    initialEntryMode: DatePickerEntryMode.calendarOnly);
                if (dateTime != null&& selectedDate!=dateTime) {
                  selectedDate = dateTime;
                  setState(() {});
                }
              },
              child: Text(
                dateFormat.format(selectedDate),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            DefultElevatedButton(label: "Add", onPressed:(){
               if (formKey.currentState!.validate())
             addTask();
             })
          ],
        ),
      ),
    );
  }

  void addTask() {
  TaskModel task= TaskModel(title: titleController.text,
    description: descriptionController.text,
     date: selectedDate,
    id: "");
    FirebaseFunction.addTaskToFirestore(task).timeout(
      Duration(microseconds: 100),
      onTimeout:
      (){
        
        Navigator.of(context).pop();

      },
    ).catchError(
      (error){
        print(error);

      },
    );
  }
}
