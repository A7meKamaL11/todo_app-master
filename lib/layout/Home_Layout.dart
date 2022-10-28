import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/shared/components/components.dart';
import 'package:todo_app/shared/components/constants.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class Home_layout extends StatelessWidget {
  var scafoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  Home_layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit()..CreateDatabase(),
        child: BlocConsumer<AppCubit, CubitStates>(
          listener: (context, state) {
            if (state is InsertIntoDataBase) {
              Navigator.pop(context);
              AppCubit.get(context).titleControler.clear();
              AppCubit.get(context).timeControler.clear();
              AppCubit.get(context).dateControler.clear();
            }
          },
          builder: (context, state) {
            // AppCubit().CreateDatabase();
            AppCubit cubit = BlocProvider.of(context);
            return Scaffold(
                key: scafoldKey,
                appBar: AppBar(
                  backgroundColor: HexColor('#373A36'),
                  title: Center(child: Text(cubit.titles[cubit.currentIndex])),
                  titleTextStyle: TextStyle(
                    color: HexColor('#FFA400'),
                    fontSize: 20,
                  ),
                ),
                body: ConditionalBuilder(
                    condition: state is! GetDataBaseLoadingState,
                    builder: (context) => cubit.screens[cubit.currentIndex],
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator())),
                floatingActionButton: FloatingActionButton(
                  splashColor: HexColor('#FFA400'),
                  backgroundColor: HexColor('#FFA400'),
                  onPressed: () {
                    if (cubit.isButtonSheetShown) {
                      if (formKey.currentState!.validate()) {
                        cubit
                            .insertToDatabase(
                                date: cubit.dateControler.text,
                                time: cubit.timeControler.text,
                                title: cubit.titleControler.text)
                            .then((value) {
                          cubit.isButtonSheetShown = false;
                          cubit.ChangeButtonSheet(
                              isShow: false, Icon: Icons.edit);
                        });
                      }
                    } else {
                      scafoldKey.currentState
                          ?.showBottomSheet(
                              (context) => Container(
                                    color: Colors.grey[200],
                                    padding: EdgeInsets.all(10.0),
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          defaultTextForm(
                                              type: TextInputType.text,
                                              controller: cubit.titleControler,
                                              label: 'title',
                                              onTap: () {},
                                              validate: (String? value) {
                                                if (value == '') {
                                                  return 'title is required ';
                                                }
                                                return null;
                                              },
                                              prefixIcon: Icons.title),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          defaultTextForm(
                                              type: TextInputType.datetime,
                                              controller: cubit.timeControler,
                                              label: 'Time',
                                              onTap: () {
                                                showTimePicker(
                                                        context: context,
                                                        initialTime: TimeOfDay
                                                            .fromDateTime(
                                                                DateTime.now()))
                                                    .then((value) {
                                                  cubit.timeControler.text =
                                                      value!
                                                          .format(context)
                                                          .toString();
                                                });
                                              },
                                              validate: (String? value) {
                                                if (value!.isEmpty) {
                                                  return 'time is required ';
                                                }
                                                return null;
                                              },
                                              prefixIcon: Icons.calendar_month),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          defaultTextForm(
                                              type: TextInputType.text,
                                              controller: cubit.dateControler,
                                              label: 'Date',
                                              onTap: () {
                                                showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime.now(),
                                                        lastDate:
                                                            DateTime.parse(
                                                                '2022-12-30'))
                                                    .then((value) {
                                                  cubit.dateControler.text =
                                                      DateFormat.yMMMd()
                                                          .format(value!);
                                                });
                                              },
                                              validate: (String? value) {
                                                if (value!.isEmpty) {
                                                  return 'date is required ';
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
                                color: HexColor('#FFA400'),
                              ))
                          .closed
                          .then((value) {
                        cubit.ChangeButtonSheet(
                            isShow: false, Icon: Icons.edit);
                      });
                      cubit.ChangeButtonSheet(isShow: true, Icon: Icons.add);
                    }
                  },
                  child: Icon(cubit.fabIcon),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endDocked,
                bottomNavigationBar: AnimatedBottomNavigationBar(
                  icons: const [
                    Icons.menu,
                    Icons.done,
                    Icons.archive,
                  ],
                  onTap: (value) {
                    cubit.ChangeNavigationbar(value);
                  },
                  activeIndex: cubit.currentIndex,
                  backgroundColor: HexColor('#373A36'),
                  splashColor: HexColor('#FFA400'),
                  activeColor: HexColor('#FFA400'),
                  gapLocation: GapLocation.end,
                  notchSmoothness: NotchSmoothness.verySmoothEdge,
                  leftCornerRadius: 32,
                  splashSpeedInMilliseconds: 300,
                  iconSize: 35,
                  splashRadius: 50,
                  shadow: BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 12,
                      spreadRadius: 0.5,
                      color: HexColor('#FFA400')),
                ));
          },
        ));
  }
}
