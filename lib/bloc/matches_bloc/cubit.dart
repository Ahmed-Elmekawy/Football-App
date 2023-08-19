import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/matches_bloc/states.dart';
import 'package:football/network/remote/api_football.dart';

class MatchesCubit extends Cubit<MatchesStates>{
  MatchesCubit():super(MatchesInitialState());

  static MatchesCubit get(context){
    return BlocProvider.of(context);
  }
  List<dynamic> matches=[];
  dynamic map;
  void getMatches(int leagueId,int season)async{
    emit(MatchesLoadingState());
    print(state);
    try{
      map= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=$leagueId&season=$season&timezone=Africa/Cairo");
      matches=map["response"];
      emit(MatchesSuccessState());
      print(state);
    }
    catch(error){
      emit(MatchesLoadingState());
      print(error.toString());
    }
  }
}