import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:todo_app/shared/components/constants.dart';
import 'package:todo_app/shared/observer.dart';

import 'layout/Home_Layout.dart';


void main() {
  //var EmailController=TextEditingController();
  //var PassController=TextEditingController();
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
      home:SplashScreenView(
        navigateRoute: Home_layout(),
        duration: 6000,
        imageSize: 130,
        imageSrc: 'assets/logo.png',
        text: "ToDo App ",
        textType: TextType.ColorizeAnimationText,
        textStyle: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        colors: [
          HexColor('#373A36'),
          HexColor('#FFA400'),

        ],
        backgroundColor: Colors.white,
      )
      // ,
    );

  }
}