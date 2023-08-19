import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/assists_bloc/states.dart';
import 'package:football/network/remote/api_football.dart';

class AssistsCubit extends Cubit<AssistsStates>{
  AssistsCubit():super(AssistsInitialState());

  static AssistsCubit get(context){
    return BlocProvider.of(context);
  }
  List<dynamic> assists=[];
  dynamic map;
  void getAssists(int leagueId,int season)async{
    emit(AssistsLoadingState());
    print(state);
    try{
      map= await HttpHelper.getData("https://v3.football.api-sports.io/players/topassists?league=$leagueId&season=$season");
      assists=map["response"];
      emit(AssistsSuccessState());
      print(state);
    }
    catch(error){
      emit(AssistsLoadingState());
      print(error.toString());
    }
  }
}