import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/ranking_bloc/cubit.dart';
import 'package:football/bloc/ranking_bloc/states.dart';
import 'package:football/shared/components.dart';

class Standing extends StatelessWidget {
  const Standing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: BlocConsumer<StandingCubit,StandingStates>(
          listener: (context, state){
          } ,
          builder: (context, state) {
            if (state is StandingLoadingState){
              return const Center(child: CircularProgressIndicator(color: Colors.green,));
            }
            else{
              return SingleChildScrollView(
                child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: rankingItem("MP", "W", "D", "L", "GF", "GA", "GD", "Pts",
                              txt1: "Club"
                          )
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10,left:10,bottom: 10),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 10,left: 10),
                            child: rankingItem(
                                StandingCubit.get(context).ranking[index]["all"]["played"],
                                StandingCubit.get(context).ranking[index]["all"]["win"],
                                StandingCubit.get(context).ranking[index]["all"]["draw"],
                                StandingCubit.get(context).ranking[index]["all"]["lose"],
                                StandingCubit.get(context).ranking[index]["all"]["goals"]["for"],
                                StandingCubit.get(context).ranking[index]["all"]["goals"]["against"],
                                StandingCubit.get(context).ranking[index]["goalsDiff"],
                                StandingCubit.get(context).ranking[index]["points"],
                                rank: StandingCubit.get(context).ranking[index]["rank"],
                                teamName: StandingCubit.get(context).ranking[index]["team"]["name"],
                                teamImage: StandingCubit.get(context).ranking[index]["team"]["logo"]
                            ),
                          ),
                          separatorBuilder: (context, index) =>const Padding(
                            padding: EdgeInsets.all(10),
                            child: Divider(),
                          ) ,
                          itemCount: StandingCubit.get(context).ranking.length
                      ),
                      const SizedBox(height: 10,)
                    ],
                ),
              );
            }
          }
      ),
    );
  }
}
