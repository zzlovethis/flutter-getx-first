
import 'package:get/get.dart';
import 'controller.dart';

class BlogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogPageController>(() => BlogPageController());
  }
}
