import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/NewsAppCubit/Cubit/StatasNews.dart';
import 'package:news_app/NewsAppCubit/Cubit/cubitNews.dart';
import '../../components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNews,NewsStats>(

      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {

        var list = CubitNews().get(context).science;

        return articalBulider(list);
      },


    );
  }
}
