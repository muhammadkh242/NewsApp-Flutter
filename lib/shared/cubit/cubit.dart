import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/module/businessNews/business_screen.dart';
import 'package:news/module/homeNews/home_screen.dart';
import 'package:news/module/sportsNews/sports_screen.dart';
import 'package:news/network/dio_helper.dart';
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

  List<dynamic> homeNews = [];

  void navigateBottomNavScreen(int index){
    bottomNavIndex = index;
    emit(AppBottomNavState());
  }

  void getHomeNews(){
    emit(HomeLoading());
    DioHelper.getNews(url: "v2/top-headlines", query: {
      'country': 'us',
      'category': 'general',
      'apiKey': 'a1c2f37b0a744dcf9026ae1e1bcee545'
    }).then((value)
    {
      homeNews = value.data['articles'];
      //print(homeNews);
      //print(homeNews[0]['title']);
      emit(HomeSuccess());
    }).catchError((error)
    {
      print(error.toString());
      emit(HomeError());
    });
  }
}