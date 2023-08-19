import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/redcard_bloc/states.dart';
import 'package:football/network/remote/api_football.dart';

class RedCardCubit extends Cubit<RedCardStates>{
  RedCardCubit():super(RedCardInitialState());

  static RedCardCubit get(context){
    return BlocProvider.of(context);
  }
  List<dynamic> redCard=[];
  dynamic map;
  void getRedCard(int leagueId,int season)async{
    emit(RedCardLoadingState());
    print(state);
    try{
      map= await HttpHelper.getData("https://v3.football.api-sports.io/players/topredcards?league=$leagueId&season=$season");
      redCard=map["response"];
      emit(RedCardSuccessState());
      print(state);
    }
    catch(error){
      emit(RedCardLoadingState());
      print(error.toString());
    }
  }
}