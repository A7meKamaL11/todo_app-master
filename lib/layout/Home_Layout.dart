import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';


class Home_layout extends StatelessWidget{



  var scafoldKey=GlobalKey<ScaffoldState>();
  var formKey =GlobalKey<FormState>();


  Home_layout({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>AppCubit()..CreateDatabase(),
      child:BlocConsumer<AppCubit,CubitStates>(
          listener: (context, state) {
            if (state is InsertIntoDataBase)
            {
              Navigator.pop(context);
              AppCubit.get(context).titleControler.clear();
              AppCubit.get(context).timeControler.clear();
              AppCubit.get(context).dateControler.clear();
            }
          },
        builder: (context, state) {

            // AppCubit().CreateDatabase();
             AppCubit cubit =BlocProvider.of(context);
          return Scaffold(
            key: scafoldKey,
            appBar: AppBar(
              title: Center(child: Text(cubit.titles[cubit.currentIndex])),
            ),
            body: ConditionalBuilder(condition:state is! GetDataBaseLoadingState ,
                builder:(context)=>cubit.screens[cubit.currentIndex] ,
                fallback:(context)=>Center(child: CircularProgressIndicator()) ),
            floatingActionButton:
            FloatingActionButton(
              onPressed: () {

                if(cubit.isButtonSheetShown)
                {
                  if(formKey.currentState!.validate()){
                     cubit.insertToDatabase(
                        date: cubit.dateControler.text,
                        time: cubit.timeControler.text,
                        title: cubit.titleControler.text
                    ).then((value){
                      cubit.isButtonSheetShown=false;
                      cubit.ChangeButtonSheet(isShow: false, Icon: Icons.edit);
                    });

                  }

                }
                else{
                  scafoldKey.currentState?.
                  showBottomSheet((context) =>
                      Container(
                        color: Colors.grey[200],
                        padding: EdgeInsets.all(10.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultTextForm(type: TextInputType.text,
                                  controller: cubit.titleControler,
                                  label: 'title',
                                  onTap: (){
                                  },
                                  validate: (String?value){
                                    if(value=='')
                                    {
                                      return'title is required ';
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.title),
                              SizedBox(
                                height: 10.0,
                              ),
                              defaultTextForm(type: TextInputType.datetime,
                                  controller: cubit.timeControler,
                                  label: 'Time',
                                  onTap: (){
                                    showTimePicker(context: context,
                                        initialTime: TimeOfDay.fromDateTime(DateTime.now())).then((value) {

                                      cubit.timeControler.text=value!.format(context).toString();
                                    });
                                  },
                                  validate: (String?value){
                                    if(value!.isEmpty)
                                    {
                                      return'time is required ';
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.calendar_month),
                              const SizedBox(
                                height: 10.0,
                              ),
                              defaultTextForm(type: TextInputType.text,
                                  controller: cubit.dateControler,
                                  label: 'Date',
                                  onTap: (){
                                    showDatePicker(context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2022-12-30')).
                                    then((value) {
                                      cubit.dateControler.text=DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                  validate: (String?value){
                                    if(value!.isEmpty)
                                    {
                                      return'date is required ';
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icons.access_time),


                            ],
                          ),
                        ),
                      ),
                      elevation: 40.0,
                      shape: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.blue
                      )
                  ).closed.then((value){
                    cubit.ChangeButtonSheet(isShow: false, Icon: Icons.edit);

                  });
                  cubit.ChangeButtonSheet(isShow: true, Icon: Icons.add);

                }
              },


              child: Icon(cubit.fabIcon),
            )
            ,
            bottomNavigationBar: BottomNavigationBar(items: [
              BottomNavigationBarItem(icon: Icon(Icons.menu),label:'Tasks'),
              BottomNavigationBarItem(icon: Icon(Icons.done),label:'Done'),
              BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),label:'Archived')
            ],
              type:BottomNavigationBarType.fixed ,
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.ChangeNavigationbar(value);
              },
            ),

          ) ;
        },
      )

    );
  }



}













