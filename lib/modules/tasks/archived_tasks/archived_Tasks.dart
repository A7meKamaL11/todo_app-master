import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';

class archived_Tasks extends StatelessWidget {
  const archived_Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CubitStates>(
      builder: (context, state) {
        var tasks = AppCubit.get(context).Archivedtasks;
        return ScreenConditional(tasks: tasks, icon: Icons.archive_outlined);
      },
      listener: (context, state) {},
    );
  }
}
