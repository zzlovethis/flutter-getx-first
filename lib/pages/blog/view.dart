import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/pages/blog/widgets/blog_page_list.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class BlogPage extends GetView<BlogPageController> {
  @override
  Widget build(BuildContext context) {
    return BlogPageList();
  }
}