import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/blog_list.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../index.dart';
import 'widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BlogPageList extends StatefulWidget {

  BlogPageList({Key? key}) : super(key: key);

  @override
  _BlogPageListState createState() => _BlogPageListState();
}

class _BlogPageListState extends State<BlogPageList>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  final controller = Get.find<BlogPageController>();

  RefreshController blogRefreshController = RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    //controller.fetchBlogList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog 清单'),
      ),
      body: GetX<BlogPageController>(
        init: controller,
        builder: (controller) => SmartRefresher(
          enablePullUp: true,
          controller: this.blogRefreshController,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          child: ListView.builder(
            itemCount: controller.state.blogList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(UniqueKey().toString()),
                onDismissed: (direction) {
                  String? strName =
                      controller.state.blogList[index].id.toString();
                  Get.snackbar("$strName deleted", "deleted !!!");
                  controller.deleteBlogList(controller.state.blogList[index]);
                },
                child: ListTile(
                  title:
                      Text(controller.state.blogList[index].title.toString()),
                  leading: CircleAvatar(
                    child: Text(controller.state.blogList[index].id.toString()),
                  ),
                  onTap: () {
                    Get.to(BlogDetailsScreen(controller.state.blogList[index]));
                  },
                  trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        //Get.dialog(widget);
                      }),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Get.to(()=>AddTaskPage());
          Future.delayed(Duration.zero,(){
            Get.to(()=>AddTaskPage());
          });
          //Get.offAndToNamed('/blogListAddTask');
          //Get.toNamed('/blogListAddTask');
          // void _popupMenuSelected(PopupMenuChoice choice) {
          //   Navigator.push(context, choice.pageRoute);
          // }
          // navigator?.pushNamed(
          //   ,
          //   ),
          // );
          //controller.fetchBlogList(isRefresh: false);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}



