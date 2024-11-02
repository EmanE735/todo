import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/auth/login_screen.dart';
import 'package:todo/auth/register_sreen.dart';
import 'package:todo/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/tabs/tasks/tasks_provider.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
 await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
    create: (_)=> TasksProvider(),
    child: const TodoApp()));
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
        LoginScreen.routeName : (_) => LoginScreen(),
        RegisterScreen.routeName : (_) => RegisterScreen(),

      },
      initialRoute: HomeScreen.routeName,
          theme: AppTheme.lighttheme,
      //darkTheme:AppTheme.darktheme ,
      themeMode: ThemeMode.light,
    );
  }
}
