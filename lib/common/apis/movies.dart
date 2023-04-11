import 'package:dio/dio.dart';
//import 'dart:convert';
//import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
//import 'package:flutter_ducafecat_news_getx/common/utils/utils.dart';
//import 'package:flutter_ducafecat_news_getx/common/values/values.dart';
//import 'package:flutter_ducafecat_news_getx/main.dart';

import '../entities/movies.dart';
import 'dart:async';

class MoviesAPI {
  /// get
  static Future<List<Movie>?> get() async {

    Dio dio = Dio();

    //String? url = 'http://192.168.1.174:4000/v1/movies';
    String? url = 'http://192.168.43.158:4000/v1/movies';


    Response response = await dio.get(url); //.map((e) =>MoviesEntity.fromJson(e)).toList();

    print(response.data);

    //print(response.data);
    //print("11111111");

    //print(jsonDecode(response.data).runtimeType);

    //var json = jsonDecode(response.data);

    //print(json.runtimeType);
    //final movieEntity = MoviesEntity.fromJson(Map<String, dynamic>.from(response.data));
    //print("2222222");
    final movieEntity = MoviesEntity.fromJson((response.data as Map<dynamic, dynamic>).cast<String, dynamic>());




    //final movieEntity = MoviesEntity.fromJson(json);

    //print(movieEntity.runtimeType);

    final originList = movieEntity.movies as List;

    // print(originList.runtimeType);
    // print(originList.toString());
    // print(originList.length);
    //originList.forEach((v)=> print('${}');

    //forEach((v) => print('student name is ${student.name}'));
    // print(originList[1].genres);
    // print('44444444');
    return originList as List<Movie>;


    //Property property = Property.fromJson(json['property']);
    // Movies property = .fromJson(response['property']);
    //final json = response.data;
    //final Map<String, dynamic> json = jsonDecode(response.data);
    //final Map<String, dynamic> json = json.Decode(Movies.fromJson(response.data)); //as Map;

    //final Map<String, dynamic> jsonMap = jsonDecode(response.data);

    //print('jsonMap runType is ${jsonMap.runtimeType}');
   //  final MoviesEntity moviesList = MoviesEntity.fromJson(
   //      jsonDecode(response.data));
   //
   //
   //
   //  //final Map<String, dynamic> moviesEntity = MoviesEntity.fromJson(jsonDecode(response.data)) as Map<String, dynamic>;
   //  //ClassInfo classInfo = ClassInfo.fromJson(jsonMap);
   // // moviesList.movies?.forEach((movie) =>
   //      //print('student name is ${movie.title}'));
   //
   //
   //  // if (json['movies'] != null) {
   //  //   movies = <Movies>[];
   //  //   json['movies'].forEach((v) {
   //  //     movies!.add(new Movies.fromJson(v));
   //  //   });
   //  // }
   //
   //  if (moviesList.movies != null) {
   //    final listMovies = <Movie>[];
   //    moviesList.movies!.forEach((v) {
   //      listMovies.add(v);
   //    }
   //    );
   //
   //    // moviesList.movies!.map((value) => listMovies.toList());
   //    // }
   //    print(listMovies.length);
   //    return listMovies;
    }
    //return moviesList;

}
    //final originList = MoviesEntity{'movies'} as List;
    // List<Movie> movieList =
    // originList.map((value) => Movie.fromJson(value)).toList()






    //json = Movies.fromJson(jsonMap)//as Map;

    //print('jsonMap runType is ${jsonMap.runtimeType}');

    // if (jsonMap['movies'] != null) {
    //   final listMovies = <Movies>[];
    //   jsonMap['movies'].forEach((v) {
    //     listMovies.add(Movies.fromJson(v));
    //   });
    //   print(listMovies.length);
    //   return listMovies;
    // } else {
    //   return [];
    // }
    // if (json['movies'] != null) {
    //   movies = <Movies>[];
    //
    //   json['movies'].forEach((v) {
    //     movies!.add(Movies.fromJson(v));
    //   });
    //
    //   print(movies.length);
    // }
    //final MoviesEntity json = json.Decode(response.data);
    //print(json.length);
    // final listMovies = <Movies>[];
    // return movies;
    //print("Start");


    // if (json['movies'] != null) {
    //   movies = <Movies>[];
    //   json['movies'].forEach((v) {
    //     movies!.add(Movies.fromJson(v));
    //   });
    // }

    //
    // if (json['movies'] != null)  await {
    //   movies = <Movies>[];
    //   json['movies'].forEach((v) {
    //     movies!.add(Movies.fromJson(v));
    //   });
    //   print('111111');
    //   return movies;
    // } else {
    //   print('2222222');
    //   return [];
    // }

    //return MoviesEntity.fromJson(json);

//var result = <MoviesEntity>[];
    //var result = jsonDecode(response.data).map((e)=>MoviesEntity.fromJson(e)).toList();

    // if (json['movies'] != null) {
    //   final movies = <MoviesEntity>[];
    //   json['movies'].forEach((v) {
    //     movies.add(MoviesEntity.fromJson(v));
    //   });
    //   print("11111");
    //   return movies;
    //
    // } else {
    //   print("2222");
    //   return [];
    //
    // }




    //print(response.data.toString());

    //return movies;




  // /// 登录
  // static Future<MoviesEntity> login({
  //   UserLoginRequestEntity? params,
  // }) async {
  //   var response = await HttpUtil().post(
  //     '/user/login',
  //     data: params?.toJson(),
  //   );
  //   return UserLoginResponseEntity.fromJson(response);
  // }
  //
  // /// 注册
  // static Future<UserRegisterRequestEntity> register({
  //   UserRegisterRequestEntity? params,
  // }) async {
  //   var response = await HttpUtil().post(
  //     '/user/register',
  //     data: params?.toJson(),
  //   );
  //   return UserRegisterRequestEntity.fromJson(response);
  // }



  /// Logout
  // static Future logout() async {
  //   return await HttpUtil().post(
  //     '/user/logout',
  //   );
  // }

