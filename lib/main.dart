import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
 await FirebaseFirestore.instance.disableNetwork();
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),

      },
      initialRoute: HomeScreen.routeName,
          theme: AppTheme.lighttheme,
      //darkTheme:AppTheme.darktheme ,
      themeMode: ThemeMode.light,
    );
  }
}
