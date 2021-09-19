import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/BlocObserver/BlocObserver.dart';
import 'package:news_app/Dio/sherdPrefrens.dart';
import 'package:news_app/NewApp/NewsLayout/news_layout.dart';

import 'Dio/DioHelper.dart';
import 'NewApp/CubetForDatabase/AppCubet.dart';
import 'NewApp/CubetForDatabase/AppState.dart';
import 'NewsAppCubit/Cubit/cubitNews.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  DioHelper.inti();

  await CacheHelper.init();

  bool isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));

}

class MyApp extends StatelessWidget {

  final bool isDark;

  const MyApp(this.isDark, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => CubitNews()
            ..getBusiness()
            ..getSport()
            ..getScience(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changThemeMode(
              fromShard: isDark,
            ),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {

          return MaterialApp(

            debugShowCheckedModeBanner: false,

            theme: ThemeData(

              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(
                bodyText2: TextStyle(
                  color: Colors.grey[600],
                ),
                bodyText1: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),

              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
              ),

              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.white,
                ),
                elevation: 0.0,
              ),
            ),

            darkTheme: ThemeData(

              textTheme: TextTheme(
                bodyText2: TextStyle(
                  color: Colors.grey[400],
                ),
                bodyText1: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),

              primarySwatch: Colors.deepOrange,

              scaffoldBackgroundColor: HexColor('333739'),

              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.white30,
                backgroundColor: Colors.black12,
                elevation: 1.5,
              ),

              appBarTheme: AppBarTheme(

                backgroundColor: HexColor('333739'),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: HexColor('333739'),
                ),
                elevation: 0.0,
              ),
            ),

            themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,

            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
