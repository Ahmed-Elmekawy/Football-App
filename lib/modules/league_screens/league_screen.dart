import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/assists_bloc/cubit.dart';
import 'package:football/bloc/matches_bloc/cubit.dart';
import 'package:football/bloc/ranking_bloc/cubit.dart';
import 'package:football/bloc/redcard_bloc/cubit.dart';
import 'package:football/bloc/scorers_bloc/cubit.dart';
import 'package:football/bloc/yellowcard_bloc/cubit.dart';
import 'package:football/modules/league_screens/assists_screen.dart';
import 'package:football/modules/league_screens/matches_screen.dart';
import 'package:football/modules/league_screens/redcard_screen.dart';
import 'package:football/modules/league_screens/scorers_screen.dart';
import 'package:football/modules/league_screens/table_screen.dart';
import 'package:football/modules/league_screens/yellowcard_screen.dart';

class League extends StatelessWidget {
   int leagueId;
   int season;
   dynamic color;
   League({required this.leagueId,required this.season,
    required this.color
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => StandingCubit()..getRanking(leagueId,season),
          ),
          BlocProvider(create: (context) => MatchesCubit()..getMatches(leagueId, season),
          ),
          BlocProvider(create: (context) => ScorersCubit()..getScorers(leagueId, season),
          ),
          BlocProvider(create: (context) => AssistsCubit()..getAssists(leagueId, season),
          ),
          BlocProvider(create: (context) => YellowCardCubit()..getYellowCard(leagueId, season),
          ),
          BlocProvider(create: (context) => RedCardCubit()..getRedCard(leagueId, season),
          )
        ],
        child:DefaultTabController(

          initialIndex: 0,
          length: 6,
          child: Scaffold(
              appBar: AppBar(
                title: const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                backgroundColor: color,
                bottom: const TabBar(
                  labelStyle: TextStyle(
                    fontSize:12
                  ),
                  isScrollable: false,
                  physics:NeverScrollableScrollPhysics() ,
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  tabs: [
                    Text("Standing",maxLines: 1,overflow: TextOverflow.ellipsis,),
                    Text("Matches",maxLines: 1,overflow: TextOverflow.ellipsis,),
                    Text("Scorers",maxLines: 1,overflow: TextOverflow.ellipsis,),
                    Text("Assists",maxLines: 1,overflow: TextOverflow.ellipsis,),
                    Text("Yellow cards",maxLines: 1,overflow: TextOverflow.ellipsis,),
                    Text("Red cards",maxLines: 1,overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
              body:const TabBarView(
                children: [
                  Standing(),
                  Matches(),
                  Scorers(),
                  Assists(),
                  YellowCards(),
                  RedCards(),
                ],
              )
          ),
        )
    );
  }
}