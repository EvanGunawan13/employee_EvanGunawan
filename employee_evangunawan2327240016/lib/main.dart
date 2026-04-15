import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:employee_evangunawan2327240016/firebase_options.dart';
import 'package:employee_evangunawan2327240016/screens/add_employee.dart';
import 'package:employee_evangunawan2327240016/services/employee_service.dart';
import 'package:employee_evangunawan2327240016/screens/home_Screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomeScreen()
    );
  }
}

