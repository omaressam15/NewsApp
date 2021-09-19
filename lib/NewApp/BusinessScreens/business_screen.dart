import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/NewsAppCubit/Cubit/cubitNews.dart';
import 'package:news_app/NewsAppCubit/Cubit/StatasNews.dart';
import 'package:news_app/components.dart';

class BusinessScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<CubitNews,NewsStats>(

      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {

        var list = CubitNews().get(context).business;

        return articalBulider(list);
      },


    );
  }
}
