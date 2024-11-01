import 'package:todo/models/task_models.dart';
import 'package:todo/widgets/firebase_function.dart';
import 'package:flutter/material.dart';

class TasksProvider with ChangeNotifier {
  DateTime selectedDate =DateTime.now();


   List <TaskModel> tasks =[];
   Future<void> getTasks()async{
  tasks=  await FirebaseFunction.getAllTasksFromeFirestore();
  tasks = tasks.where((task) =>
        task.date.year==selectedDate.year&&
        task.date.month==selectedDate.month&&
        task.date.day==selectedDate.day

  ).toList();
  
  notifyListeners();

  }

 void changeSelectedDate(DateTime date){
    selectedDate =date;
    notifyListeners();

  }

}