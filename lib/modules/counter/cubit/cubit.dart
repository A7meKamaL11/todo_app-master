import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/counter/cubit/states.dart';

class counterCubit extends Cubit<counterStates>{
  counterCubit(): super(initState());
  int counter =1;
  static counterCubit get (context )=>BlocProvider.of(context);
  void counterPlus (){
    counter++;
    emit(plusState(counter));
  }
  void counterMunis (){
    counter--;
    emit(minusState(counter));
  }


}