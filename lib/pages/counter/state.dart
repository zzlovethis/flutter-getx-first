import 'package:flutter_ducafecat_news_getx/common/apis/apis.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
import 'package:get/get.dart';
// import "dart:core.dart";

class CounterState {

  //final counter = 2.obs;

  final counter = 0.obs;

  increment(){
    return counter.value++;
  }

  //final origin = MoviesAPI.get().obs;

  //final movies = MoviesAPI.get().obs;

  RxList<Movie> movies = <Movie>[].obs;


  // fetch() async{
  //
  // }
  //var movies = [].obs;
  //dynamic fetch() async {
    //var result = await MoviesAPI.get();
    //var result = await movie;
    //return result;
    //return result;
  //}
  // Future<dynamic> fetch() async {
  //   var result = await MoviesAPI.get();
  //   return result;
  // }
    // NewsAPI.newsPageList(
    //   params: NewsPageListRequestEntity(
    //     categoryCode: categoryCode,
    //     pageNum: curPage + 1,
    //     pageSize: pageSize,
    //   ),
    // );

    // if (isRefresh == true) {
    //   curPage = 1;
    //   total = result.counts!;
    //   state.newsList.clear();
    // } else {
    //   curPage++;
    // }

    // movies.addAll(result);








}
