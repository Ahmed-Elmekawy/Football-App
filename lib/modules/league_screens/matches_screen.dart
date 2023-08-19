import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/matches_bloc/cubit.dart';
import 'package:football/bloc/matches_bloc/states.dart';
import 'package:football/shared/components.dart';

class Matches extends StatelessWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: BlocConsumer<MatchesCubit,MatchesStates>(
        listener: (context, state) {
        },
        builder:(context, state) {
          if (state is MatchesLoadingState){
            return const Center(child: CircularProgressIndicator(color: Colors.green,));
          }
          else{
          return ListView.separated(itemBuilder: (context, index) {
            return match(
                state: MatchesCubit.get(context).matches[index]["fixture"]["status"]["long"],
                homeLogo: MatchesCubit.get(context).matches[index]["teams"]["home"]["logo"],
                awayLogo: MatchesCubit.get(context).matches[index]["teams"]["away"]["logo"],
                homeGoal: MatchesCubit.get(context).matches[index]["goals"]["home"],
                awayGoal: MatchesCubit.get(context).matches[index]["goals"]["away"],
                roundName: MatchesCubit.get(context).matches[index]["league"]["round"],
                date: MatchesCubit.get(context).matches[index]["fixture"]["date"]
            );
          },
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(right: 10,left: 10),
            child: Divider(),
          ),
          itemCount:MatchesCubit.get(context).matches.length ,
        );
        }
        }
      ),
    );
  }
}
