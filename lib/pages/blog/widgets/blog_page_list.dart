import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/blog_list.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
import '../../../common/services/sqliteDBhelper.dart';
import '../../../common/entities/entities.dart';





class BlogPageList extends StatefulWidget {
  @override
  _BlogPageListState createState() => _BlogPageListState();
}

class _BlogPageListState extends State<BlogPageList> {

  List<BlogList> blogList;
  DbHelper helper = DbHelper();
  BlogListDialog dialog;

  @override
  void initState() {
    dialog = BlogListDialog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog List'),
      ),
      body: ListView.builder(
          itemCount: (blogList != null) ? blogList.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(blogList[index].title),
                onDismissed: (direction) {
                  String strName = blogList[index].title];
                  helper.deleteList(blogList[index]);
                  setState(() {
                    blogList.removeAt(index);
                  });
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("$strName deleted")));
                },
                child: ListTile(
                    title: Text(blogList[index].title),
                    leading: CircleAvatar(
                      child: Text(blogList[index].priority.toString()),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ItemsScreen(shoppingList[index])),
                      );
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                dialog.buildDialog(
                                    context, shoppingList[index], false));
                      },
                    )));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) =>
                dialog.buildDialog(context, ShoppingList(0, '', 0), true),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }

  Future showData() async {
    await helper.openDb();
    BlogList = await helper.getLists();
    setState(() {
      shoppingList = shoppingList;
    });
  }
}

class NewsPageList extends StatefulWidget {
  NewsPageList({Key? key}) : super(key: key);

  @override
  _NewsPageListState createState() => _NewsPageListState();
}

class _NewsPageListState extends State<NewsPageList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetX<CategoryController>(
      init: controller,
      builder: (controller) => SmartRefresher(
        enablePullUp: true,
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0.w,
                horizontal: 0.w,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (content, index) {
                    var item = controller.state.newsList[index];
                    return newsListItem(item);
                  },
                  childCount: controller.state.newsList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
