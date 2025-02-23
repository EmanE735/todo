import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/task_models.dart';

class FirebaseFunction {
  static CollectionReference<TaskModel> getTasksCollection()=> FirebaseFirestore.instance.collection("tasks")
  .withConverter<TaskModel>(fromFirestore: (docSnapshot,_) =>
  TaskModel.fromJson(docSnapshot.data()!),
   toFirestore: (taskModel,_)=>taskModel.toJson());


   static Future<void> addTaskToFirestore(TaskModel task){
   CollectionReference<TaskModel> taskCollection =getTasksCollection();
   DocumentReference<TaskModel> doc=taskCollection.doc();
   task.id=doc.id;
   return doc.set(task);

   }
  static Future<List<TaskModel>>  getAllTasksFromeFirestore() async{
     CollectionReference<TaskModel> taskCollection =getTasksCollection();
    QuerySnapshot<TaskModel> querySnapshot= await taskCollection.get();
   return querySnapshot.docs.map((docSnapshot)=>docSnapshot.data()).toList();
  }

  static Future<void> deletTaskFromFirestore(String taskId)async{
    CollectionReference<TaskModel> taskCollection =getTasksCollection();
   return taskCollection.doc(taskId).delete();

  }
}

