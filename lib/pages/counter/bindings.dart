import 'dart:developer';

import 'package:flutter_ducafecat_news_getx/pages/category/index.dart';
import 'package:flutter_ducafecat_news_getx/pages/main/index.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CounterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(() => CounterController());
  }
}
