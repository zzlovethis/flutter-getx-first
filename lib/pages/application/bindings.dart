import 'package:flutter_ducafecat_news_getx/pages/blog/controller.dart';
import 'package:flutter_ducafecat_news_getx/pages/category/index.dart';
import 'package:flutter_ducafecat_news_getx/pages/main/index.dart';
import 'package:flutter_ducafecat_news_getx/pages/counter/index.dart';
//import 'package:flutter_ducafecat_news_getx/pages/blog/index.dart';

import 'package:get/get.dart';

import 'controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<CounterController>(() => CounterController());
    Get.lazyPut<BlogPageController>(() => BlogPageController());

  }
}
