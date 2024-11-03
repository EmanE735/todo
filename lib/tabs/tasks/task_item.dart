import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/models/task_models.dart';
import 'package:todo/tabs/tasks/edit_task.dart';
import 'package:todo/tabs/tasks/tasks_provider.dart';
import 'package:todo/widgets/firebase_function.dart';

class TaskItem extends StatefulWidget {
  TaskModel task;
  TaskItem(this.task);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool click =true;

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
                FirebaseFunction.deletTaskFromFirestore(widget.task.id)
                    .timeout(Duration(microseconds: 100),
                        onTimeout: () =>
                            Provider.of<TasksProvider>(context, listen: false)
                                .getTasks())
                    .catchError((_) => Fluttertoast.showToast(
                        msg: "something went wrong",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0));
              },
              backgroundColor: AppTheme.red,
              foregroundColor: AppTheme.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
              SlidableAction(
        onPressed: (_){

          showModalBottomSheet(context: context,
        isScrollControlled: true,
         builder: (_)=>
        EditTask(oldTask: widget.task,)
        );
          
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        icon: Icons.edit,
        label: 'edit',
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
                    color:(click==true) ?AppTheme.primary:AppTheme.green,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.task.title,
                      style:(click== true)? Theme.of(context).textTheme.titleMedium :Theme.of(context).textTheme.titleMedium!.copyWith(color: AppTheme.green) ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(widget.task.description,
                      style: Theme.of(context).textTheme.titleSmall)
                ],
              ),
              Spacer(),
              (click ==true)?
              Container(
                  height: 34,
                  width: 69,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      click =false;
                      setState(() {
                        
                      });

                    },
                    
                    child: Icon(
                      Icons.check,
                      color: AppTheme.white,
                      size: 32, 
                    ),
                  )
                  ):Text("Done!",style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppTheme.green) ),
                  SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
