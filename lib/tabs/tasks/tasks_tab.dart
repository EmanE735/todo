import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';

import 'package:todo/tabs/tasks/task_item.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:todo/tabs/tasks/tasks_provider.dart';


class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  bool shouldGetTasks=true;
 
  @override
  Widget build(BuildContext context) {
    
    double screenHeight = MediaQuery.sizeOf(context).height;

    TasksProvider tasksProvider =Provider.of<TasksProvider>(context);
    if (shouldGetTasks){
       tasksProvider.getTasks();
       shouldGetTasks=false;

    }
    
    return Column(
      children: [
        Stack(children: [
          Container(
            height: screenHeight * 0.15,
            width: double.infinity,
            color: AppTheme.primary,
          ),
          PositionedDirectional(
            start: 20,
            
            child: SafeArea(
              child: Text(
                "ToDo List",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.white,
                      fontSize: 22,
                    ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.1),
            child: EasyInfiniteDateTimeLine(
              showTimelineHeader: false,
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              focusDate: tasksProvider.selectedDate,
              onDateChange: (selectedDate){
                tasksProvider.changeSelectedDate(selectedDate);
                tasksProvider.getTasks();
              },
              lastDate: DateTime.now().add(Duration(days: 365)),
              activeColor: AppTheme.white,
              dayProps: EasyDayProps(
                  height: 79,
                  width: 58,
                  dayStructure: DayStructure.dayNumDayStr,
                  activeDayStyle: DayStyle(
                      decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      dayNumStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary),
                      dayStrStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary)),
                          todayStyle:  DayStyle(
                      decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      dayNumStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.black),
                      dayStrStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.black)),
                  inactiveDayStyle: DayStyle(
                      decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      dayNumStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.black),
                      dayStrStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.black))),
            ),
          ),
        ]),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (_, index) => TaskItem(tasksProvider.tasks[index]),
            itemCount:tasksProvider.tasks.length,
          ),
        ),
      ],
    );
  }
  

  
}
