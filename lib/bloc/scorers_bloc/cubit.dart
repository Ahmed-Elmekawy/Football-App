import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/scorers_bloc/states.dart';
import 'package:football/network/remote/api_football.dart';

class ScorersCubit extends Cubit<ScorersStates>{
  ScorersCubit():super(ScorersInitialState());

  static ScorersCubit get(context){
    return BlocProvider.of(context);
  }
  List<dynamic> scorers=[];
  dynamic map;
  void getScorers(int leagueId,int season)async{
    emit(ScorersLoadingState());
    print(state);
    try{
      map= await HttpHelper.getData("https://v3.football.api-sports.io/players/topscorers?league=$leagueId&season=$season");
      scorers=map["response"];
      emit(ScorersSuccessState());
      print(state);
    }
    catch(error){
      emit(ScorersLoadingState());
      print(error.toString());
    }
  }
}