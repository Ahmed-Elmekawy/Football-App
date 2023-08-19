import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/fixturestates.dart';
import 'package:football/network/remote/api_football.dart';

class YesterdayFixturesCubit extends Cubit<FixturesStates>{
  YesterdayFixturesCubit():super(InitialState());

  static YesterdayFixturesCubit get(context){
    return BlocProvider.of(context);
  }

  List<dynamic>egyptianLeagueFixtures=[];
  dynamic egyptianLeagueMap;

  void getEgyptianLeagueFixtures(int season,String date)async{
    emit(EgyptianLeagueFixturesLoadingState());
    print(state);
    try{
      egyptianLeagueMap= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=233&season=$season&date=$date&timezone=Africa/Cairo");
      egyptianLeagueFixtures=egyptianLeagueMap["response"];
      emit(EgyptianLeagueFixturesSuccessState());
      print(state);
    }
    catch(error){
      emit(EgyptianLeagueFixturesErrorState());
      print(error.toString());
    }
  }

  List<dynamic>saudiLeagueFixtures=[];
  dynamic saudiLeagueMap;

  void getSaudiLeagueFixtures(int season,String date)async{
    emit(SaudiLeagueFixturesLoadingState());
    print(state);
    try{
      saudiLeagueMap= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=307&season=$season&date=$date&timezone=Africa/Cairo");
      saudiLeagueFixtures=saudiLeagueMap["response"];
      emit(SaudiLeagueFixturesSuccessState());
      print(state);
    }
    catch(error){
      emit(SaudiLeagueFixturesErrorState());
      print(error.toString());
    }
  }

  List<dynamic>premierLeagueFixtures=[];
  dynamic premierLeagueMap;

  void getPremierLeagueFixtures(int season,String date)async{
    emit(PremierLeagueFixturesLoadingState());
    print(state);
    try{
      premierLeagueMap= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=39&season=$season&date=$date&timezone=Africa/Cairo");
      premierLeagueFixtures=premierLeagueMap["response"];
      emit(PremierLeagueFixturesSuccessState());
      print(state);
    }
    catch(error){
      emit(PremierLeagueFixturesErrorState());
      print(error.toString());
    }
  }

  List<dynamic>laLigaFixtures=[];
  dynamic laLigaMap;

  void getLaLigaFixtures(int season,String date)async{
    emit(LaLigaFixturesLoadingState());
    print(state);
    try{
      laLigaMap= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=140&season=$season&date=$date&timezone=Africa/Cairo");
      laLigaFixtures=laLigaMap["response"];
      emit(LaLigaFixturesSuccessState());
      print(state);
    }
    catch(error){
      emit(LaLigaFixturesLoadingState());
      print(error.toString());
    }
  }

  List<dynamic>ligue1Fixtures=[];
  dynamic ligue1Map;

  void getLigue1Fixtures(int season,String date)async{
    emit(Ligue1FixturesLoadingState());
    print(state);
    try{
      ligue1Map= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=61&season=$season&date=$date&timezone=Africa/Cairo");
      ligue1Fixtures=ligue1Map["response"];
      emit(Ligue1FixturesSuccessState());
      print(state);
    }
    catch(error){
      emit(Ligue1FixturesErrorState());
      print(error.toString());
    }
  }

  List<dynamic>bundesligaFixtures=[];
  dynamic bundesligaMap;

  void getBundesligaFixtures(int season,String date)async{
    emit(BundesligaFixturesLoadingState());
    print(state);
    try{
      bundesligaMap= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=78&season=$season&date=$date&timezone=Africa/Cairo");
      bundesligaFixtures=bundesligaMap["response"];
      emit(BundesligaFixturesSuccessState());
      print(state);
    }
    catch(error){
      emit(BundesligaFixturesErrorState());
      print(error.toString());
    }
  }

  List<dynamic>serieLeagueFixtures=[];
  dynamic serieLeagueMap;

  void getSerieLeagueFixtures(int season,String date)async{
    emit(SerieLeagueFixturesLoadingState());
    print(state);
    try{
      serieLeagueMap= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=135&season=$season&date=$date&timezone=Africa/Cairo");
      serieLeagueFixtures=serieLeagueMap["response"];
      emit(SerieLeagueFixturesSuccessState());
      print(state);
    }
    catch(error){
      emit(SerieLeagueFixturesErrorState());
      print(error.toString());
    }
  }

  List<dynamic>cafLeagueFixtures=[];
  dynamic cafLeagueMap;

  void getCafLeagueFixtures(int season,String date)async{
    emit(CafLeagueFixturesLoadingState());
    print(state);
    try{
      cafLeagueMap= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=12&season=$season&date=$date&timezone=Africa/Cairo");
      cafLeagueFixtures=cafLeagueMap["response"];
      emit(CafLeagueFixturesSuccessState());
      print(state);
    }
    catch(error){
      emit(CafLeagueFixturesErrorState());
      print(error.toString());
    }
  }

  List<dynamic>uefaLeagueFixtures=[];
  dynamic uefaLeagueMap;

  void getUefaLeagueFixtures(int season,String date)async{
    emit(UefaLeagueFixturesLoadingState());
    print(state);
    try{
      uefaLeagueMap= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=2&season=$season&date=$date&timezone=Africa/Cairo");
      uefaLeagueFixtures=uefaLeagueMap["response"];
      emit(UefaLeagueFixturesSuccessState());
      print(state);
    }
    catch(error){
      emit(UefaLeagueFixturesErrorState());
      print(error.toString());
    }
  }

  List<dynamic>europaLeagueFixtures=[];
  dynamic europaLeagueMap;

  void getEuropaLeagueFixtures(int season,String date)async{
    emit(EuropaLeagueFixturesLoadingState());
    print(state);
    try{
      europaLeagueMap= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=3&season=$season&date=$date&timezone=Africa/Cairo");
      europaLeagueFixtures=europaLeagueMap["response"];
      emit(EuropaLeagueFixturesSuccessState());
      print(state);
      print(europaLeagueMap);
      print(europaLeagueFixtures);
    }
    catch(error){
      emit(EuropaLeagueFixturesErrorState());
      print(error.toString());
    }
  }

  List<dynamic>confederationFixtures=[];
  dynamic confederationMap;

  void getConfederationFixtures(int season,String date)async{
    emit(ConfederationFixturesLoadingState());
    print(state);
    try{
      confederationMap= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=20&season=$season&date=$date&timezone=Africa/Cairo");
      confederationFixtures=confederationMap["response"];
      emit(ConfederationFixturesSuccessState());
      print(state);
    }
    catch(error){
      emit(ConfederationFixturesErrorState());
      print(error.toString());
    }
  }

  List<dynamic>afcLeagueFixtures=[];
  dynamic afcLeagueMap;

  void getAfcLeagueFixtures(int season,String date)async{
    emit(AfcLeagueFixturesLoadingState());
    print(state);
    try{
      afcLeagueMap= await HttpHelper.getData("https://v3.football.api-sports.io/fixtures?league=17&season=$season&date=$date&timezone=Africa/Cairo");
      afcLeagueFixtures=afcLeagueMap["response"];
      emit(AfcLeagueFixturesSuccessState());
      print(state);
    }
    catch(error){
      emit(AfcLeagueFixturesErrorState());
      print(error.toString());
    }
  }
}
