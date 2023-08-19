import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/Tomorrow_bloc/cubit.dart';
import 'package:football/bloc/fixturestates.dart';
import 'package:football/shared/components.dart';

class TomorrowMatches extends StatelessWidget {
  const TomorrowMatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: null,
      body:BlocConsumer<TomorrowFixturesCubit,FixturesStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if (state is SerieLeagueFixturesLoadingState){
              return const Center(child: CircularProgressIndicator(color: Colors.green,));
            }
            else {
                return Column(
                  children: [
                    fixtures(context,
                        fixtures: TomorrowFixturesCubit.get(context)
                            .uefaLeagueFixtures),
                    fixtures(context,
                        fixtures: TomorrowFixturesCubit.get(context)
                            .europaLeagueFixtures),
                    fixtures(context,
                        fixtures: TomorrowFixturesCubit.get(context)
                            .cafLeagueFixtures),
                    fixtures(context,
                        fixtures: TomorrowFixturesCubit.get(context)
                            .confederationFixtures),
                    fixtures(context,
                        fixtures: TomorrowFixturesCubit.get(context)
                            .afcLeagueFixtures),
                    fixtures(context,
                        fixtures: TomorrowFixturesCubit.get(context)
                            .premierLeagueFixtures),
                    fixtures(context,
                        fixtures:
                            TomorrowFixturesCubit.get(context).laLigaFixtures),
                    fixtures(context,
                        fixtures: TomorrowFixturesCubit.get(context)
                            .serieLeagueFixtures),
                    fixtures(context,
                        fixtures:
                            TomorrowFixturesCubit.get(context).ligue1Fixtures),
                    fixtures(context,
                        fixtures: TomorrowFixturesCubit.get(context)
                            .bundesligaFixtures),
                    fixtures(context,
                        fixtures: TomorrowFixturesCubit.get(context)
                            .saudiLeagueFixtures),
                  ],
                );
              }
            }
      )
    );
  }
}