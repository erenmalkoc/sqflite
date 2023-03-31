import 'package:flutter/material.dart';
import 'package:todo_sqflite_app/screens/login.dart';

import 'screens/login.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());


}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      home: Login(),


    );
  }
}
