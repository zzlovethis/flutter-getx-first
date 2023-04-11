import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'index.dart';

import 'widgets/widgets.dart';


class BlogPage extends GetView<BlogPageController> {
  @override
  Widget build(BuildContext context) {
    return BlogPageList();
  }
}