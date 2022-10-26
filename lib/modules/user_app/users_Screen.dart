import 'package:flutter/material.dart';

import '../../models/user_model/user_model.dart';

class user_Screen extends StatelessWidget {

    List<data> users=[
      data(
        id: 1,
        name: 'Ahmed kamal mohamady'
        ,numb:012114546345,
      ),data(
        id: 2,
        name: 'mohamed kamal mohamady'
        ,numb:012114546345,
      ),data(
        id: 3,
        name: 'Ali kamal mohamady'
        ,numb:012114546345,
      )
    ];


  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
    title: const Text('users'),
    ),
      body:ListView.separated(itemBuilder: (context,index)=>buildItem(users[index]), separatorBuilder: (context,index)=>Container(
        height: 2.0,
        color: Colors.blueAccent,
      ), itemCount: users.length)

    );
  }
  Widget buildItem(data user)=>Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children:  [
            CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.brown,
            ),
            Text('${user.id}',style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),

            )
          ],
        ),
      ),
      Expanded(child: Column(
        children: [
          Text('${user.name}',style: TextStyle(
            color: Colors.brown,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          ),
          Text('${user.numb}',style: TextStyle(
            color: Colors.grey,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),)
        ],
      ))
    ],
  );
}
