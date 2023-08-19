import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/App_bloc/states.dart';
import 'package:football/modules/fixtures_screens/fixtures_screen.dart';
import 'package:football/modules/league_screens/select_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() :super(InitialState());

  static AppCubit get(context) {
    return BlocProvider.of(context);
  }
  List<Widget>screen=[
    const Fixtures(),
    const SelectLeague(),
  ];
  List<BottomNavigationBarItem>items=[
    const BottomNavigationBarItem(
      icon: Icon(Icons.scoreboard_outlined),
      label: "Fixtures"
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_soccer_outlined),
        label: "Leagues"
    ),
  ];
  int currentIndex=0;

  void onTap(int index){
    currentIndex=index;
    emit(BottomNavigationBarState());
  }
}