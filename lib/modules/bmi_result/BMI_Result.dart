import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMI_Result extends StatelessWidget {

final bool ismale;
final double weight;
final double height;
final double age;
BMI_Result({
  required this.weight, required this.ismale, required this.height, required this.age
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('gender :${ismale?'male':'female'}',
            style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
            ),),
            Text('heiht :${height.round()}',
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),),
            Text('age :${age.round()}',
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),),
            Text('weight :${weight.round()}',
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),)
          ],
        ),
      ),
    );
  }
}
