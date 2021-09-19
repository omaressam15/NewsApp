import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/NewsAppCubit/Cubit/StatasNews.dart';
import 'package:news_app/NewsAppCubit/Cubit/cubitNews.dart';
import 'package:news_app/components.dart';

class SearchScreen extends StatelessWidget {

  var textSearch = TextEditingController();

  SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNews,NewsStats> (
      listener: (BuildContext context,state){},
      builder: (BuildContext context,state){

        var list = CubitNews().get(context).searchNews;

        return Scaffold(

          appBar: AppBar(),

          body:Column(
            children: [

              Padding(

                padding: const EdgeInsets.all(15.0),
                child: defaultFormField(
                  controller: textSearch,
                    label: 'Search',
                    iconData: Icons.search,
                    validator: (String value){

                    },
                    onChange: (String value){

                      CubitNews().get(context).getSearchNews(value);

                      print(value);

                    }

                ),
              ),
              Expanded(
                  child: articalBulider(list),

              ),


            ],
          )


        );
      },
    );
  }
}
