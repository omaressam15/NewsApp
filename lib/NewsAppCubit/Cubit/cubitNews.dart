import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Dio/DioHelper.dart';
import 'package:news_app/NewApp/BusinessScreens/business_screen.dart';
import 'package:news_app/NewApp/ScienceScreen/science_screen.dart';
import 'package:news_app/NewApp/SportsScreen/sport_screen.dart';
import 'package:news_app/NewsAppCubit/Cubit/StatasNews.dart';

class CubitNews extends Cubit<NewsStats>{

  CubitNews () :super (InitialNewsState());

  CubitNews get(context) =>BlocProvider.of(context);

  int currentIndex = 0;

  List <BottomNavigationBarItem> bottomNavigationBarItem =[

    BottomNavigationBarItem(
      icon: Icon(Icons.business,),
      label: 'Business',
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball),
      label: 'Sports',

    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.science,),
      label: 'Science',
    ),

  ];

  List <Widget> screes = [

    BusinessScreen(),

    SportScreen(),

    ScienceScreen(),

  ];

  void changeBottomNavigationBar(int index){

    currentIndex = index;

    emit(ChangeButtonNavigationBar());

  }

  List <dynamic> business = [];

  void getBusiness (){

    emit(LoadingToGetBusinessStats());

    DioHelper.getData(url:'v2/top-headlines',

        query: {

          'country':'eg',
          'category':'business',
          'apiKey':'f29f95749d6a4748b440387c169eb691',

        }).then((value) {

          business = value.data['articles'];

      print(business[2]['title']);

      emit(GetBusinessDataStats());

    }).catchError((error){
      print(error.toString());
      emit(ErrorGetBusinessDataStats(error.toString()));
    });

  }


  List <dynamic> sport = [];

  void getSport (){

    emit(LoadingToGetSportsStats());

    DioHelper.getData(url:'v2/top-headlines',

        query: {

          'country':'eg',
          'category':'sport',
          'apiKey':'f29f95749d6a4748b440387c169eb691',

        }).then((value) {

          sport = value.data['articles'];

      print(business[2]['title']);

      emit(GetSportsDataStats());

    }).catchError((error){
      print(error.toString());
      emit(ErrorGetSportsDataStats(error.toString()));
    });

  }



  List <dynamic> science = [];

  void getScience (){

    emit(LoadingToGetScienceStats());

    DioHelper.getData(url:'v2/top-headlines',

        query: {

          'country':'eg',
          'category':'science',
          'apiKey':'f29f95749d6a4748b440387c169eb691',

        }).then((value) {

          science = value.data['articles'];

      print(business[2]['title']);

      emit(GetScienceDataStats());

    }).catchError((error){
      print(error.toString());
      emit(ErrorGetScienceDataStats(error.toString()));
    });

  }

  List <dynamic> searchNews = [];

  void getSearchNews (value){

    emit(LoadingToGetSearchStats());

    searchNews = [];

    DioHelper.getData(url:'v2/everything',

        query: {

          'q':'$value',
          'apiKey':'f29f95749d6a4748b440387c169eb691',

        }).then((value) {

      searchNews = value.data['articles'];

      print(searchNews[2]['title']);



      emit(GetSearchDataStats());

    }).catchError((error){
      print(error.toString());
      emit(ErrorGetSearchDataStats(error.toString()));
    });

  }




}
