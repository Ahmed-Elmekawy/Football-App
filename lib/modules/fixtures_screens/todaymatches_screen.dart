import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/fixturestates.dart';
import 'package:football/bloc/todayfixtures_bloc/cubit.dart';
import 'package:football/shared/components.dart';

class TodayMatches extends StatelessWidget {
  const TodayMatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: null,
      body:BlocConsumer<TodayFixturesCubit,FixturesStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is SerieLeagueFixturesLoadingState){
            return const Center(child: CircularProgressIndicator(color: Colors.green,));
          }
          else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      fixtures(context,
                          fixtures: TodayFixturesCubit.get(context).uefaLeagueFixtures),
                      fixtures(context, fixtures: TodayFixturesCubit.get(context).europaLeagueFixtures),
                      fixtures(context, fixtures: TodayFixturesCubit.get(context).cafLeagueFixtures),
                      fixtures(context, fixtures: TodayFixturesCubit.get(context).confederationFixtures),
                      fixtures(context, fixtures: TodayFixturesCubit.get(context).afcLeagueFixtures),
                      fixtures(context, fixtures: TodayFixturesCubit.get(context).premierLeagueFixtures),
                      fixtures(context, fixtures: TodayFixturesCubit.get(context).laLigaFixtures),
                      fixtures(context, fixtures: TodayFixturesCubit.get(context).serieLeagueFixtures),
                      fixtures(context, fixtures: TodayFixturesCubit.get(context).ligue1Fixtures),
                      fixtures(context, fixtures: TodayFixturesCubit.get(context).bundesligaFixtures),
                      fixtures(context, fixtures: TodayFixturesCubit.get(context).saudiLeagueFixtures),
                    ],
                  ),
                );
              }
            }
      )
    );
  }
}