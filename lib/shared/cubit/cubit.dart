import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/module/businessNews/business_screen.dart';
import 'package:news/module/homeNews/home_screen.dart';
import 'package:news/module/sportsNews/sports_screen.dart';
import 'package:news/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  List<Widget> pages = [
    const HomeScreen(),
    const BusinessScreen(),
    const SportsScreen()
  ];
  int bottomNavIndex = 0;


  void navigateBottomNavScreen(int index){
    bottomNavIndex = index;
    emit(AppBottomNavState());
  }
}