import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class Counter1Page extends StatelessWidget {
  final logic = Get.put(Counter1Logic());
  final state = Get.find<Counter1Logic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
