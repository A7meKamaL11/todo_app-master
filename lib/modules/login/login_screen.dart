import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
//import 'package:flutter_proj/shared/components/components.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    var EmailController = TextEditingController();
    var PassController = TextEditingController();
    var formKey=GlobalKey<FormState>() ;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultTextForm(
                    type: TextInputType.emailAddress,
                    controller: EmailController,
                    prefixIcon: Icons.email,
                    label: 'Email',
                    validate: (value) {
                      if (value == '') {
                        return 'please enter your email';
                      }
                      return null;
                    },
                    isPassword: false,
                    onChange: (value){
                      print(value);
                    },
                    onSubmit: (value){print(value);},
                    //suffixIcon: ,
                    //suffixPressed: ,

                  ),

                  SizedBox(
                    height: 40.0,
                  ),
              defaultTextForm(
                type: TextInputType.visiblePassword,
                controller: PassController,
                prefixIcon: Icons.lock,
                label: 'Password',
                validate: (value) {
                  if (value == '') {
                    return 'please enter your password';
                  }
                  return null;
                },
                // isPassword: isPassword,
                // onChange: (value){
                //   print(value);
                // },
                //onSubmit: (value){print(value);},
                suffix:Icons.visibility,
                isPassword:false,
                suffixPressed:() {
                  setState(() {
                    isPassword=!isPassword;
                  });
                },


              ),
                  SizedBox(
                    height: 40.0,
                  ),
                  default_Button(
                    text: 'login',
                    function: () {
                      if (formKey.currentState!.validate()){
                        print(EmailController.text ); print(PassController.text);
                      }
                    },
                    radius: 10.0,
                    color: Colors.blue
                  ),
                SizedBox(
                  height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("don't have account ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),),
                    TextButton(onPressed: (){}, child: Text('Create account')),
                  ],),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
