import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/NewApp/CubetForDatabase/AppCubet.dart';
import 'package:news_app/NewApp/SearchScreen/serchScreen.dart';
import 'package:news_app/NewsAppCubit/Cubit/StatasNews.dart';
import 'package:news_app/NewsAppCubit/Cubit/cubitNews.dart';
import 'package:news_app/components.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNews,NewsStats>(
      listener: (context,stats){

      },
      builder: (context,stats){

        var cubitNews = CubitNews().get(context);

        return Scaffold(

          appBar: AppBar(
            title: const Text('News App'),
            actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {

              navigate(SearchScreen(), context);

            },),

              IconButton(onPressed: (){
                AppCubit.get(context).changThemeMode();
              },
                  icon: const Icon(Icons.brightness_4_outlined)),

            ],
          ),

          body: cubitNews.screes[cubitNews.currentIndex],
          bottomNavigationBar: BottomNavigationBar(

            items: cubitNews.bottomNavigationBarItem,
            currentIndex: cubitNews.currentIndex,
            onTap: (int index){
              cubitNews.changeBottomNavigationBar(index);
            },
          ),
        );
      },
    );
  }
}
