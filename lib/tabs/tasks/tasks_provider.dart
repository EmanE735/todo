import 'package:todo/models/task_models.dart';
import 'package:todo/widgets/firebase_function.dart';
import 'package:flutter/material.dart';

class TasksProvider with ChangeNotifier {


   List <TaskModel> tasks =[];
   Future<void> getTasks()async{
  tasks=  await FirebaseFunction.getAllTasksFromeFirestore();
  
  notifyListeners();

  }

}