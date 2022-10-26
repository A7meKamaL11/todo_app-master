import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/shared/observer.dart';

import 'layout/Home_Layout.dart';
import 'modules/bmi_app/BMI_Screen.dart';
import 'modules/counter/Counter.dart';

void main() {
  var EmailController=TextEditingController();
  var PassController=TextEditingController();
  Bloc.observer = MyBlocObserver();
  runApp(myApp());
}
class myApp extends StatefulWidget
{
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home_layout () ,
    );

  }
}