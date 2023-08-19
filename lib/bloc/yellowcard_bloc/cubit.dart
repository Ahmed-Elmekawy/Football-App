import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/yellowcard_bloc/states.dart';
import 'package:football/network/remote/api_football.dart';

class YellowCardCubit extends Cubit<YellowCardStates>{
  YellowCardCubit():super(YellowCardInitialState());

  static YellowCardCubit get(context){
    return BlocProvider.of(context);
  }
  List<dynamic> yellowCard=[];
  dynamic map;
  void getYellowCard(int leagueId,int season)async{
    emit(YellowCardLoadingState());
    print(state);
    try{
      map= await HttpHelper.getData("https://v3.football.api-sports.io/players/topyellowcards?league=$leagueId&season=$season");
      yellowCard=map["response"];
      emit(YellowCardSuccessState());
      print(state);
    }
    catch(error){
      emit(YellowCardLoadingState());
      print(error.toString());
    }
  }
}