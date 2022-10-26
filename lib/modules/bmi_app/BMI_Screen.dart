import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bmi_result/BMI_Result.dart';
//import 'package:flutter_proj/modules/bmi_result/BMI_Result.dart';
class BMI_Screen extends StatefulWidget {
  const BMI_Screen({Key? key}) : super(key: key);

  @override
  State<BMI_Screen> createState() => _BMI_ScreenState();
}

class _BMI_ScreenState extends State<BMI_Screen> {
  bool ismale=false;
  double height=120.0; double age=20.0;double weight=60.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CAlculator',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            ismale=true;
                          });
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Icon(
                                Icons.male,
                                size: 50.0,
                              ),
                              SizedBox(
                                height: 20.0,
                              )
                              ,
                              Text('Male',
                              style: TextStyle(
                                fontSize: 50.0,
                              ),)
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(20.0),
                            color: ismale?Colors.blue:Colors.grey[400],
                          ),

                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            ismale=false;
                          });

                        },
                        child: Container(
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage('https://raw.githubusercontent.com/abdullahmansss/udemy/6591ab0b424236e04980b357da031400dc35a6c0/assets/images/female.png'),
                                height: 50.0,
                                width: 40.0,
                              ),
                              SizedBox(
                                height: 20.0,
                              )
                              ,
                              Text('Female',
                                style: TextStyle(
                                  fontSize: 50.0,
                                ),)
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(20.0),
                              color:ismale?Colors.grey[400]:Colors.blue,
                          ),

                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                width: double.infinity,

                child: Column(
                  children: [
                    Text('HEIGHT',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(
                      height: 05.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${height.round()}',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                        Text('cm', style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Slider(value:height,
                    max: 220,
                        min: 100,onChanged: (value){
                      setState(() {
                        height=value;
                      });
                    })
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(20.0),
                          color: Colors.grey[400]
                      ),
                      child: Column(
                        children: [
                          Text('AGE',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                          Text('${age}',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              mini: true,
                              child: Icon(
                                Icons.add
                              ),),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                                mini: true,
                                child: Icon(
                                    Icons.remove
                                ),)
                            ],
                          )

                        ],

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(20.0),
                          color: Colors.grey[400]
                      ),
                      child: Column(
                        children: [
                          Text('AGE',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                          Text('${weight}',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                                mini: true,
                                child: Icon(
                                    Icons.add
                                ),),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                                mini: true,
                                child: Icon(
                                    Icons.remove
                                ),)
                            ],
                          )

                        ],

                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BMI_Result(weight: weight, ismale: ismale, height: height, age: age),));
            },
            child: Text('calculate'
            ,style: TextStyle(
                color: Colors.white
              ),),),
          )
        ],
      ),
    );
  }
}
