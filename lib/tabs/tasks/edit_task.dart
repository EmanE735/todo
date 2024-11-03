import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/tabs/tasks/tasks_provider.dart';
import 'package:todo/widgets/defult_elevated_button.dart';
import 'package:todo/widgets/defult_text_form_filed.dart';
import 'package:todo/widgets/firebase_function.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditTask extends StatefulWidget {
   EditTask({required this.oldTask});

  TaskModel oldTask;

  @override
  State<EditTask> createState() => _AddModalBottomSheetState();
}

class _AddModalBottomSheetState extends State<EditTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text =widget.oldTask.title;
    descriptionController.text =widget.oldTask.description;
    selectedDate=widget.oldTask.date;
   
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.6,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Edit task",
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
              DefultElevatedButton(label: "edit", onPressed:(){
                 if (formKey.currentState!.validate())
               editTask(widget.oldTask.id);
               })
            ],
          ),
        ),
      ),
    );
  }

  void editTask(String id) {
  TaskModel task= TaskModel(title: titleController.text,
    description: descriptionController.text,
     date: selectedDate,
    id: id);
    FirebaseFunction.updateTask(task.id,task).timeout(
      Duration(microseconds: 100),
      onTimeout:
      (){
        
        Navigator.of(context).pop();
        Provider.of<TasksProvider>(context, listen: false).getTasks();
          Fluttertoast.showToast(
        msg: "task edited successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );

      },
    ).catchError(
      (error){
        Fluttertoast.showToast(
        msg: "something went wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

      },
    );
  }
}