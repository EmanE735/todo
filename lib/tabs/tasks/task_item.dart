import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
              Text("play basketball",
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(
                height: 4,
              ),
              Text("time", style: Theme.of(context).textTheme.titleSmall)
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
              child: Icon(Icons.check,
              color: AppTheme.white,
              size: 32,
              ))
        ],
      ),
    );
  }
}
