import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/assists_bloc/cubit.dart';
import 'package:football/bloc/assists_bloc/states.dart';
import 'package:football/shared/components.dart';

class Assists extends StatelessWidget {
  const Assists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: BlocConsumer<AssistsCubit,AssistsStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is AssistsLoadingState){
            return const Center(child: CircularProgressIndicator(color: Colors.green,));
          }
          else {
            return topScorer("Assists",
              type1: "goals",
              type2: "assists",
              list: AssistsCubit.get(context).assists,
            );
          }
        }
    )
    );
  }
}
