import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_apps/interfaces/i_my_api.dart';
import 'package:flutter_apps/model/news_result.dart';

class MyApi implements IMyApi{

  final String upcomingUrl="https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.fandango.com%2Frss%2Fcomingsoonmovies.rss";
  final String superheroUrl="https://api.rss2json.com/v1/api.json?rss_url=https://www.fandango.com/movies/superhero/rss/movie-list.rss";
  final String topTenUlr="https://api.rss2json.com/v1/api.json?rss_url=https://www.fandango.com/rss/top10boxoffice.rss";


  Future<List<Items>> fetchData(String url) async{


    var response=await http.get(url);
    print(response.body.toString());


    NewsResult nr = NewsResult.fromJson(json.decode(response.body));

    List<Items> items=nr.items;

    print(items.length);
    return items;

  }


  @override
  Future<List<Items>> fetchUpcoming()async {
    return await fetchData(upcomingUrl);


  }

  @override
  Future<List<Items>> fetchSuperhero() async{
    return await fetchData(superheroUrl);
  }

  @override
  Future<List<Items>> fetchTopTen() async{
    return await fetchData(topTenUlr);
  }




}