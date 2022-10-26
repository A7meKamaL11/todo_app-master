import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              print('you pressed menu');
            },
          ),
          title: Text(
            'WahtsApp',
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  print('youPressedNotification');
                },
                icon: Icon(Icons.circle_notifications)),
            IconButton(
                onPressed: () {
                  print('youPressedSearch');
                },
                icon: Icon(Icons.search))
          ],
          backgroundColor: Colors.teal,
        ),
        body:Column(
          children: [

            Container(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                    )
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image(image:
                      NetworkImage('https://images.macrumors.com/t/mrf67cJ_XtlqMC9buU5FUeie0Ww=/1200x1200/smart/article-new/2021/03/Whatsapp-Feature.jpg'),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10
                        ),
                        color: Colors.black.withOpacity(.6),
                        //width:double.infinity ,
                        child: Text('Chats',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                        ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )

          ],
        )
      ,
    );
    }
}
