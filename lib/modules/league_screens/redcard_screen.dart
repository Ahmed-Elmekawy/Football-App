import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/redcard_bloc/cubit.dart';
import 'package:football/bloc/redcard_bloc/states.dart';
import 'package:football/shared/components.dart';

class RedCards extends StatelessWidget {
  const RedCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: BlocConsumer<RedCardCubit,RedCardStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if (state is RedCardLoadingState){
              return const Center(child: CircularProgressIndicator(color: Colors.green,));
            }
            else {
              return topScorer("Red cards",
                  type1: "cards",
                  type2: "red",
                  list: RedCardCubit.get(context).redCard
              );
            }
          }
      ),
    );
  }
}
