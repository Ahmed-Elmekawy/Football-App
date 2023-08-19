import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/yellowcard_bloc/cubit.dart';
import 'package:football/bloc/yellowcard_bloc/states.dart';
import 'package:football/shared/components.dart';

class YellowCards extends StatelessWidget {
  const YellowCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: BlocConsumer<YellowCardCubit,YellowCardStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if (state is YellowCardLoadingState){
              return const Center(child: CircularProgressIndicator(color: Colors.green,));
            }
            else {
              return topScorer(
                "Yellow cards",
                type1: "cards",
                type2: "yellow",
                list: YellowCardCubit.get(context).yellowCard,
              );
            }
          }
      ),
    );
  }
}
