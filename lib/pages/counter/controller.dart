import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ducafecat_news_getx/common/routers/routes.dart';
import 'package:flutter_ducafecat_news_getx/common/utils/utils.dart';
//import values/values.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uni_links/uni_links.dart';
//import 'package:flutter_ducafecat_news_getx/common/entities/'
import '../../common/apis/apis.dart';
import 'index.dart';
import '../../common/entities/entities.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
import 'package:flutter_ducafecat_news_getx/common/apis/apis.dart';



class CounterController extends GetxController {

  CounterController();

  /// 响应式成员变量

  final state = CounterState();

  // Future<void> fetchMovies() async {
  // //   var result = await MoviesAPI.get();
  // //
  // //   state.movies.addAll(result);
  // // }


  // Future<void> fetch() async {
  //  state.movies = await MoviesAPI.get();
  //
  // }

  // Future<dynamic> fetch() async {
  //   var result = await MoviesAPI.get();
  //   return movies.addAll(result);
  //   //return result;
  //
  // }

  /// 成员变量
  int total = 6;
// Future<dynamic> fetch() async {
//     var result = await MoviesAPI.get();
//     //return movies.addAll(result);
//     //debugPrint(result.length);
//     return state.movies.addAll(result);
//
//   }

  Future<List<Movie>?> fetchMovie() async {
    var result = await MoviesAPI.get();


    state.movies.addAll(result!);
  }

  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  void onRefresh() {
    fetchMovie().then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  void onLoading() {
    if (state.movies.length < total) {
      fetchMovie().then((_) {
        refreshController.loadComplete();
      }).catchError((_) {
        refreshController.loadFailed();
      });
    } else {
      refreshController.loadNoData();
    }
  }
  // Future<List<Movie>?> fetchMovie() async {
  //   var movies = await MoviesAPI.get();
  //   return movies;
  //
  //   //return movies.addAll(result);
  // }


  /// 生命周期

  @override
  void onInit() {
    super.onInit();

  }

    // handleInitialUri();
    // handleIncomingLinks();


    @override
    void onReady() {
      super.onReady();
      fetchMovie();
      //state.fetch();
    }

    @override
    void onClose() {
      super.onClose();
    }

    @override
    void dispose() {
      //uriSub?.cancel();

      super.dispose();
      //CounterController.dispose();
    }
  }
