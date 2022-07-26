import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/module/businessNews/business_screen.dart';
import 'package:news/module/homeNews/home_screen.dart';
import 'package:news/module/sportsNews/sports_screen.dart';
import 'package:news/network/dio_helper.dart';
import 'package:news/preferences/preferences.dart';
import 'package:news/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  List<Widget> pages = [
    HomeScreen(),
    const BusinessScreen(),
    const SportsScreen()
  ];
  int bottomNavIndex = 0;

  List<dynamic> homeNews = [];
  List<dynamic> businessNews = [];
  List<dynamic> sportsNews = [];

  bool isDark = false;

  void navigateBottomNavScreen(int index){
    bottomNavIndex = index;
    if(index == 1){
      getBusinessNews();
    }else if (index == 2){
      getSportsNews();
    }
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
      emit(HomeSuccess());
    }).catchError((error)
    {
      print(error.toString());
      emit(HomeError());
    });
  }

  void getSearchNews({required String searchValue}){
    if(searchValue.isEmpty){
      getHomeNews();
    } else{
      emit(HomeLoading());
      DioHelper.getNews(url: "v2/everything", query: {
        'q': searchValue,
        'apiKey': 'a1c2f37b0a744dcf9026ae1e1bcee545'
      }).then((value)
      {
        homeNews = value.data['articles'];
        emit(HomeSuccess());
      }).catchError((error)
      {
        print(error.toString());
        emit(HomeError());
      });
    }

  }

  void getBusinessNews(){
    if(businessNews.isEmpty){
      emit(BusinessLoading());
      DioHelper.getNews(url: "v2/top-headlines", query: {
        'country': 'us',
        'category': 'business',
        'apiKey': 'a1c2f37b0a744dcf9026ae1e1bcee545'
      }).then((value)
      {
        businessNews = value.data['articles'];
        emit(BusinessSuccess());
      }).catchError((error)
      {
        print(error.toString());
        emit(BusinessError());
      });
    } else{
      emit(BusinessSuccess());
    }

  }

  void getSportsNews(){
    if(sportsNews.isEmpty){
      emit(SportsLoading());
      DioHelper.getNews(url: "v2/top-headlines", query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': 'a1c2f37b0a744dcf9026ae1e1bcee545'
      }).then((value)
      {
        sportsNews = value.data['articles'];
        emit(SportsSuccess());
      }).catchError((error)
      {
        print(error.toString());
        emit(SportsError());
      });
    } else {
      emit(SportsSuccess());
    }

  }

  void changeAppTheme({required bool fromMain}){
    if(fromMain){
      print("in if");
      isDark = PreferencesHelper.getPreferences(key: "isDark") ?? false;
      emit(ChangeTheme());

    }else{
      print("in else");
      isDark = !isDark;
      PreferencesHelper.putPreferences(key: "isDark", value: isDark).then((value)
      {
        emit(ChangeTheme());
      });
    }
  }
}