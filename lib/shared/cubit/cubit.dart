
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/shared/cubit/states.dart';

import '../../modules/tasks/archived_tasks/archived_Tasks.dart';
import '../../modules/tasks/done_tasks/done_Tasks.dart';
import '../../modules/tasks/new_tasks/new_tasks.dart';


class AppCubit extends Cubit<CubitStates>{
  AppCubit():super(InitState());


   static AppCubit get(context)=>BlocProvider.of(context);


  var titleControler=TextEditingController();
  var timeControler=TextEditingController();
  var dateControler=TextEditingController();
  IconData? fabIcon =Icons.edit;
  Database? database;
  List<Map> Newtasks=[];
  List<Map> Donetasks=[];
  List<Map> Archivedtasks=[];
  int currentIndex = 0;
  List<Widget> screens=[
    new_Tasks(),
    done_Tasks(),
    archived_Tasks()
  ];
  List<String> titles=[
    'New Tasks',
    'Done Tasks',
    'Archived Tasks'
  ];

  void ChangeNavigationbar(index){

    currentIndex=index;
    emit(ChangeNavigationBar());
  }

  void CreateDatabase ()  {
    openDatabase('todo.db',
      version: 1,
      onCreate: (database,version){
        database.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT,date TEXT,time TEXT,status TEXT )').then((value){
          print('table created');
        });
      },
      onOpen: (database){
        print('database opened');

        // {
        //   tasks = value;
        //   emit(GetDataBaseState());
        //   // print(tasks);
        // });
      },
    ).then((value)
    {
      database = value;
      getDataBase(database);

      emit(CreateDataBaseState());


    });



  }
  Future insertToDatabase({required String? title, required String? time, required String? date,}) async {
    return await database?.transaction((txn) {
      txn.rawInsert('INSERT INTO tasks (title,date,time,status) VALUES ("$title","$date","$time","NEW")',).
      then((value){
        print('$value raw is inserted');
        emit(InsertIntoDataBase());
        getDataBase(database);


      }).catchError((error){
        print('error is ${error.toString()}');
      });
      return Future(() => null);
    });


  }
  void getDataBase(database) {
    Newtasks=[];
    Archivedtasks=[];
    Donetasks=[];
    // emit(GetDataBaseLoadingState());
       database!.rawQuery('SELECT * FROM tasks').then((value){

      value.forEach((element) {
       if (element['status']=='NEW') Newtasks.add(element);

       else if(element['status']=='DONE') Donetasks.add(element);

       else Archivedtasks.add(element);

        });
        emit(GetDataBaseState());
        // print(Newtasks);
        // print(Donetasks);
        // print(Archivedtasks);
      return Future(() => null);
    });


  }

  bool isButtonSheetShown=false;
  void ChangeButtonSheet({@required bool? isShow, @required IconData? Icon})
  {
    isButtonSheetShown=isShow!;
    fabIcon =Icon;
    emit(ChangeButtonSheetState());
  }
  void UpdateToDatabase ({required int id, required String status}) async {

     await database?.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value)
     {
       getDataBase(database);
       emit(UpdateDataBase());


     });


  }
  
  void DeleteFromDatabase ({required int id,}) async {

     await database?.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value){

       getDataBase(database);
       emit(DeleteFromDatabaseState());
     });
  }

}