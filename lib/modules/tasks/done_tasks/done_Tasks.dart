import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/components/constants.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';

class done_Tasks extends StatelessWidget {
  const done_Tasks({Key? key}) : super(key: key);

  //const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,CubitStates>(builder:(context, state) {
       var tasks=AppCubit.get(context).Donetasks;
      return ScreenConditional(tasks: tasks, icon: Icons.task);
    }, listener: (context, state) {

    },);
  }
}
