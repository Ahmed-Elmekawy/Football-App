import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/fixturestates.dart';
import 'package:football/bloc/yesterdayfixtures_bloc/cubit.dart';
import 'package:football/shared/components.dart';

class YesterdayMatches extends StatelessWidget {
  const YesterdayMatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: null,
      body:BlocConsumer<YesterdayFixturesCubit,FixturesStates>(
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
                          fixtures: YesterdayFixturesCubit.get(context)
                              .uefaLeagueFixtures),
                      fixtures(context,
                          fixtures: YesterdayFixturesCubit.get(context)
                              .europaLeagueFixtures),
                      fixtures(context,
                          fixtures: YesterdayFixturesCubit.get(context)
                              .cafLeagueFixtures),
                      fixtures(context,
                          fixtures: YesterdayFixturesCubit.get(context)
                              .confederationFixtures),
                      fixtures(context,
                          fixtures: YesterdayFixturesCubit.get(context)
                              .afcLeagueFixtures),
                      fixtures(context,
                          fixtures: YesterdayFixturesCubit.get(context)
                              .premierLeagueFixtures),
                      fixtures(context,
                          fixtures: YesterdayFixturesCubit.get(context)
                              .laLigaFixtures),
                      fixtures(context,
                          fixtures: YesterdayFixturesCubit.get(context)
                              .serieLeagueFixtures),
                      fixtures(context,
                          fixtures: YesterdayFixturesCubit.get(context)
                              .ligue1Fixtures),
                      fixtures(context,
                          fixtures: YesterdayFixturesCubit.get(context)
                              .bundesligaFixtures),
                      fixtures(context,
                          fixtures: YesterdayFixturesCubit.get(context)
                              .saudiLeagueFixtures),
                    ],
                  ),
                );
              }
            }
      )
    );
  }
}