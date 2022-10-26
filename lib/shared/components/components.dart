import 'dart:ffi';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/components/constants.dart';
import 'package:todo_app/shared/cubit/cubit.dart';

import 'constants.dart';

Widget default_Button({
  double width =double.infinity,
  Color color =Colors.blue,
  bool IsUpper =true,
  @required String? text ,
  @required VoidCallback? function,
  double? radius ,

}) => Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius!)),
      child: MaterialButton(

        onPressed:  function,
        child: Text(
          '${IsUpper? text?.toUpperCase():text}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: color,
      ),
    );




Widget defaultTextForm ({
@required TextInputType? type,
  @required  TextEditingController? controller,
  ValueChanged<String>? onSubmit ,
  ValueChanged? onChange,
  required FormFieldValidator<String> validate,
  String? label,
  @required IconData? prefixIcon,
  IconData? suffix,
  bool isPassword =false,
  VoidCallback? suffixPressed,
  GestureTapCallback? onTap,

})
=>TextFormField(
controller: controller,
keyboardType: type,
    validator: validate,
onTap:onTap ,
onFieldSubmitted: onSubmit,
  obscureText: isPassword,
    onChanged: onChange,
decoration: InputDecoration(
label: Text('$label'),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0)),
prefixIcon:Icon(prefixIcon
),
  suffixIcon:IconButton(icon:Icon(suffix) ,onPressed: suffixPressed,)
));


Widget buildTaskItem (Map model,context)
=>Dismissible(
  key:  Key(model['id'].toString()),
  onDismissed: (direction){

    AppCubit.get(context).DeleteFromDatabase(id:model['id']);

  },
  child:   Container(
    padding: EdgeInsets.all(20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 40.0,
          child: Text(
            '${model['time']}'
            ,style: TextStyle(
            color: Colors.white
          ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${model['title']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
              SizedBox(
                height: 7.0,
              ),
              Text('${model['date']}',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600]
                ),),
            ],
          ),
        ),
        IconButton(onPressed: (){
        AppCubit.get(context).UpdateToDatabase(
            id: model['id'],
            status: 'DONE');
        }
        , icon: Icon(
          Icons.check_box,
          color: Colors.blue,
        )),
        IconButton(onPressed: (){
          AppCubit.get(context).UpdateToDatabase(
              id: model['id'],
          status: 'archived');
        }, icon: Icon(
          Icons.archive,
          color: Colors.black38,
        ))
      ],
    ),
  ),
);

Widget ScreenConditional ({required List<Map> tasks,required IconData icon})=>ConditionalBuilder(
  condition:tasks.length>0 ,
  builder:(context){
    return ListView.separated(itemBuilder: (context,index)=> buildTaskItem(tasks[index],context),
        separatorBuilder: (context,index)=>
        const Divider(
          color: Colors.grey,
          thickness: 3.0,
        ),
        itemCount: tasks.length);
  } ,
  fallback:(context){

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 100,
          ),
          Text('No Tasks yet , Add tasks'
            ,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600]
            ),
          )
        ],
      ),
    );
  } ,
);