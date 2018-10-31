import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_apps/interfaces/i_my_api.dart';
import 'package:flutter_apps/model/news_result.dart';
import 'package:scoped_model/scoped_model.dart';



class MyViewModel extends Model{

  List<Items> _topten;
  List<Items> _superhero;
  List<Items> _upcoming;

  bool _isLoading=false;

  bool _noInternet=false;


  List<Items> get topten => _topten;

  set topten(List<Items> value) {
    _topten = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get noInternet => _noInternet;

  set noInternet(bool value) {
    _noInternet = value;
    notifyListeners();
  }


  final IMyApi api;

  MyViewModel(this.api);


  List<Items> get superhero => _superhero;

  set superhero(List<Items> value) {
    _superhero = value;
    notifyListeners();
  }

  List<Items> get upcoming => _upcoming;

  set upcoming(List<Items> value) {
    _upcoming = value;
    notifyListeners();
  }

  Future fetchTopTen() async{
    isLoading=true;
    noInternet=false;
    try{
      topten=await api.fetchTopTen();
    }catch(e){
      if(e is SocketException){
        noInternet=true;
      }
    }
    isLoading=false;
  }

  Future fetchSuperHero() async{
    isLoading=true;
    noInternet=false;
    try{
      superhero=await api.fetchSuperhero();
    }catch(e){
      if(e is SocketException){
        noInternet=true;
      }
    }
    isLoading=false;
  }



  Future fetctUpcoming() async{
    isLoading=true;
    noInternet=false;
    try{
      upcoming=await api.fetchUpcoming();
    }catch(e){
      if(e is SocketException){
        noInternet=true;
      }
    }
    isLoading=false;
  }





}