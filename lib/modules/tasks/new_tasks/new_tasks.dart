import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class new_Tasks extends StatelessWidget {
  const new_Tasks({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,CubitStates>(builder:(context, state) {
      var tasks=AppCubit.get(context).Newtasks;
      return ScreenConditional(tasks:tasks,icon: Icons.menu);
    }, listener: (context, state) {

    },);
  }
}
