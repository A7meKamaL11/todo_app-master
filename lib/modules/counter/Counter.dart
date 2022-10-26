import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/counter/cubit/cubit.dart';
import 'package:todo_app/modules/counter/cubit/states.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => counterCubit(),
      child: BlocConsumer<counterCubit,counterStates>(
        builder: (context, state) {
          return  Scaffold(
            appBar: AppBar(
              title: Text('counter'),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100.0,
                ),
                child: Row(
                  children: [
                  
                    TextButton(
                        onPressed: () {
                          counterCubit.get(context).counterMunis();
                        },
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 60.0,
                          ),
                        )),
                    Text(
                      '${counterCubit.get(context).counter}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 60,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                            counterCubit.get(context).counterPlus();
                        },
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 60,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
          listener: (context, state) {
          if (state is minusState){
            print( 'minus state ${state.counter}');
          };
          if (state is plusState) {
            print('plus state ${state.counter}');
          }
          },),
    );
  }
}


