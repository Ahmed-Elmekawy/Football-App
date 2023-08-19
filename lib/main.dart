import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/App_bloc/cubit.dart';
import 'package:football/bloc/Tomorrow_bloc/cubit.dart';
import 'package:football/bloc/assists_bloc/cubit.dart';
import 'package:football/bloc/ranking_bloc/cubit.dart';
import 'package:football/bloc/redcard_bloc/cubit.dart';
import 'package:football/bloc/scorers_bloc/cubit.dart';
import 'package:football/bloc/todayfixtures_bloc/cubit.dart';
import 'package:football/bloc/yellowcard_bloc/cubit.dart';
import 'package:football/bloc/yesterdayfixtures_bloc/cubit.dart';
import 'package:football/modules/app_screen.dart';
import 'package:football/modules/fixtures_screens/yesterdaymatches_screen.dart';

void main() async{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var today = "${DateTime.now()}".replaceRange(10, 23, "");
    var yesterday= today.replaceRange(8, 10, "${DateTime.now().day-1}");
    var tomorrow= today.replaceRange(8, 10, "${DateTime.now().day+1}");

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit(),
        ),
        BlocProvider(create: (context) => StandingCubit()..getRanking(39, 2022),
        ),
        BlocProvider(create: (context) => ScorersCubit()..getScorers(39, 2022),
        ),
        BlocProvider(create: (context) => AssistsCubit()..getAssists(39, 2022),
        ),
        BlocProvider(create: (context) => YellowCardCubit()..getYellowCard(39, 2022),
        ),
        BlocProvider(create: (context) => RedCardCubit()..getRedCard(39, 2022),
        ),
        BlocProvider(create: (context) => TodayFixturesCubit()..
        getUefaLeagueFixtures(2022, "${DateTime.now()}".replaceRange(10, 23, ""))..
        getEuropaLeagueFixtures(2022,today)..
        getCafLeagueFixtures(2022,today)..
        getConfederationFixtures(2022,today)..
        getAfcLeagueFixtures(2022,today)..
        getPremierLeagueFixtures(2022,today)..
        getLaLigaFixtures(2022,today)..
        getSerieLeagueFixtures(2022,today)..
        getLigue1Fixtures(2022,today)..
        getBundesligaFixtures(2022,today)..
        getSerieLeagueFixtures(2022,today),
        ),
        BlocProvider(create: (context) => YesterdayFixturesCubit()..
        getUefaLeagueFixtures(2022, yesterday)..
        getEuropaLeagueFixtures(2022,yesterday)..
        getCafLeagueFixtures(2022,yesterday)..
        getConfederationFixtures(2022,yesterday)..
        getAfcLeagueFixtures(2022,yesterday)..
        getPremierLeagueFixtures(2022,yesterday)..
        getLaLigaFixtures(2022,yesterday)..
        getSerieLeagueFixtures(2022,yesterday)..
        getLigue1Fixtures(2022,yesterday)..
        getBundesligaFixtures(2022,yesterday)..
        getSerieLeagueFixtures(2022, yesterday),
        ),
        BlocProvider(create: (context) => TomorrowFixturesCubit()..
        getUefaLeagueFixtures(2022, tomorrow)..
        getEuropaLeagueFixtures(2022,tomorrow)..
        getCafLeagueFixtures(2022,tomorrow)..
        getConfederationFixtures(2022,tomorrow)..
        getAfcLeagueFixtures(2022,tomorrow)..
        getPremierLeagueFixtures(2022,tomorrow)..
        getLaLigaFixtures(2022,tomorrow)..
        getSerieLeagueFixtures(2022,tomorrow)..
        getLigue1Fixtures(2022,tomorrow)..
        getBundesligaFixtures(2022,tomorrow)..
        getSerieLeagueFixtures(2022,tomorrow),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          scaffoldBackgroundColor: Colors.grey.withOpacity(0.2),

        ),
        home: const App(),
        ),
    );
  }
}
