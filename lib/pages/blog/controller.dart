
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_ducafecat_news_getx/common/utils/sqliteDBhelper.dart';
import 'index.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';


class BlogPageController extends GetxController {

  BlogPageController();

  /// 响应式成员变量
  final state = BlogState();

  DbHelper dbHelper = DbHelper();

  ///UI 事件
  final RefreshController _refreshController = RefreshController(
    initialRefresh: true,
  );

  get refreshController => _refreshController;

  @override
  void onInit() async{
    super.onInit();
    await DbHelper.initDatabase();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addTasks({required BlogList blogList}) async{
    return  await dbHelper.insertList(blogList);
  }

  Future<void> fetchBlogList({bool isRefresh = false}) async {

    //await DbHelper.initDatabase();

    //DbHelper.testDb();

    var result = await dbHelper.getLists();

     if (isRefresh == true) {
    state.blogList.clear();
     }

     //await showBlogList();


     print("fectch");

    state.blogList.addAll(result);
  }


   Future<void> showBlogItem(int idList) async {
    final List<Map<String, Object?>>? blogItems =
     await dbHelper.queryItem(idList);
    state.blogItem.assignAll(blogItems!.map((data) => BlogItem.fromJson(data)).toList());
  }



  Future<int> createBlogList(BlogList blogList)  {
    //DbHelper.testDb();
    return  dbHelper.insertList(blogList);
    fetchBlogList();
  }

  Future<int> createBlogItem(BlogItem item) async {
    return await dbHelper.insertItem(item);
  }

  void markBlogListCompleted(int id) async {
    await dbHelper.updateBlogLists(id);

    fetchBlogList();
  }

  void markBlogItemCompleted(int id) async {
    await dbHelper.updateBlogItem(id);
    showBlogItem(id);
  }



  void deleteBlogList(BlogList list) {
      dbHelper.deleteList(list);
     //showBlogList();
     //fetchBlogList();
  }

  /// 事件

  void onRefresh() {
    fetchBlogList(isRefresh: true).then((_) {
      _refreshController.refreshCompleted(resetFooterState: false);//true
      // 20230305 debug to always refreshing
    }).catchError((_) {
      _refreshController.refreshFailed();
    });
  }

  void onLoading() {
    if (state.blogList.length  < 20 ) {
      fetchBlogList(isRefresh: true).then((_) {
        //_refreshController.isLoading;
        _refreshController.loadComplete();
      }).catchError((_) {
        _refreshController.loadFailed();
      });
    } else {
      _refreshController.loadNoData();
    }
  }

  // 方法



  /// 生命周期

  ///dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    // dispose 释放对象
    _refreshController.dispose();
    //BlogPageController.dispose();
    //_idController.dispose();
    //final TextEditingController _titleController = TextEditingController();
    //final TextEditingController _blogNameController = TextEditingController();
    //final TextEditingController _imageUrlController = TextEditingController();
  }

}

