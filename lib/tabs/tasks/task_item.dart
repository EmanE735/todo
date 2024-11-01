import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/tabs/tasks/tasks_provider.dart';
import 'package:todo/widgets/firebase_function.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;
  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Slidable(
         key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (_) {
                FirebaseFunction.deletTaskFromFirestore(task.id)
                    .timeout(Duration(microseconds: 100),
                    onTimeout: ()
                     => Provider.of<TasksProvider>(context,listen: false).getTasks())
                    .catchError((_) => 
                       Fluttertoast.showToast(
        msg: "something went wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    )
                    
              
            );
  },
              backgroundColor: AppTheme.red,
              foregroundColor: AppTheme.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: AppTheme.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(end: 8),
                height: 62,
                width: 4,
                decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title,
                      style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(
                    height: 4,
                  ),
                  Text(task.description,
                      style: Theme.of(context).textTheme.titleSmall)
                ],
              ),
              Spacer(),
              Container(
                  height: 34,
                  width: 69,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Icon(
                    Icons.check,
                    color: AppTheme.white,
                    size: 32,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
