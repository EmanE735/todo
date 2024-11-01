import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/tabs/settings/settings_tab.dart';
import 'package:todo/tabs/tasks/add_modal_bottom_sheet.dart';

import 'package:todo/tabs/tasks/tasks_tab.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName= "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List <Widget> tabs =[
    TasksTab(),
    SettingsTab(),
    

  ];
  int currentTabIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: AppTheme.white,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        notchMargin: 10,
        child: BottomNavigationBar(
          currentIndex:  currentTabIndex,
          onTap: (index)=> setState(() {
            currentTabIndex=index;
          }),
          items: [
            BottomNavigationBarItem(
              label:"tasks" ,
              icon: Icon(Icons.list,
            
            )),
             BottomNavigationBarItem(
              label:"settings" ,
              icon: Icon(Icons.settings)),
            ],
        ),
      ),
      floatingActionButton: FloatingActionButton
      (onPressed: (){
        showModalBottomSheet(context: context,
        isScrollControlled: true,
         builder: (_)=>
        AddModalBottomSheet()
        );
      },
      child: Icon(Icons.add,
      size: 32,
      
      ),
      
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   

    );
  }
}