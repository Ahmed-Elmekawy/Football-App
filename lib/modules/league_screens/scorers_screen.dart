import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/scorers_bloc/cubit.dart';
import 'package:football/bloc/scorers_bloc/states.dart';
import 'package:football/shared/components.dart';

class Scorers extends StatelessWidget {
  const Scorers({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: BlocConsumer<ScorersCubit,ScorersStates>(
        listener: (context, state) {

        },
        builder:(context, state) {
          if (state is ScorersLoadingState){
            return const Center(child: CircularProgressIndicator(color: Colors.green,));
          }
          else {
              return topScorer(
                "Goals",
                type1: "goals",
                type2: "total",
                list: ScorersCubit.get(context).scorers,
              );
            }
          }
      ),
    );
  }
}
