import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/ranking_bloc/states.dart';
import 'package:football/network/remote/api_football.dart';

class StandingCubit extends Cubit<StandingStates>{
  StandingCubit():super(StandingInitialState());

  static StandingCubit get(context){
    return BlocProvider.of(context);
  }
  List<dynamic>ranking=[];
  dynamic map;
  void getRanking(int leagueId,int season)async{
    emit(StandingLoadingState());
    print(state);
    try{
     map= await HttpHelper.getData('https://v3.football.api-sports.io/standings?league=$leagueId&season=$season');
     ranking=map["response"][0]["league"]["standings"][0];
     emit(StandingSuccessState());
     print(state);
    }
    catch(error){
      emit(StandingLoadingState());
      print(error.toString());
    }
  }
}