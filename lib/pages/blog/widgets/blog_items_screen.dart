//import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:get/get.dart';

import '../controller.dart';
import '../widgets/widgets.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';

class BlogDetailsScreen extends StatefulWidget {
  final BlogList blogList;

  BlogDetailsScreen(this.blogList);

  @override
  _BlogDetailsScreenState createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {

  //final QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    //_controller.document = Document.fromJson(widget.blogList.title);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BlogPageController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.blogList.title ?? "Untitled"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Get.toNamed('/editBlog',
                  arguments: BlogList(
                    id: widget.blogList.id,
                    title: widget.blogList.title,
                    //content: _controller.document.toJson(),
                    blogName: widget.blogList.blogName,
                    createdDateTime: widget.blogList.createdDateTime,
                    //modifiedDateTime: DateTime.now(),
                    category: widget.blogList.category,
                    imageUrl: widget.blogList.imageUrl,
                    favorateNum: widget.blogList.favorateNum,
                  ));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '本博客的作者是${widget.blogList.blogName ?? "Unknown"}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '本博客内容：${widget.blogList.content ?? "Unknown"}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '本博客属于${widget.blogList.category ?? "Unknown"}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '本博客创作于${widget.blogList.createdDateTime ?? "Unknown"}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),


              // QuillEditor(
              //   controller: _controller,
              //   readOnly: true,
              //   expands: false,
              //   focusNode: null,
              //   scrollController: null,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// //import 'package:flutter_quill/flutter_quill.dart' hide Text;
// import '../controller.dart';
// import '../widgets/widgets.dart';
// import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
//
// class BlogDetailsScreen extends StatelessWidget {
//
//
//   final BlogList blogList;
//
//   BlogDetailsScreen(this.blogList);
//
//   final controller = Get.find<BlogPageController>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     // final quillController = QuillController(
//     //   document: Document.fromJson(this.blogList),
//     //   selection: TextSelection.collapsed(offset: 0),
//     // );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(blogList.title ?? "Untitled"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               // Get.toNamed('/editBlog',
//               //     arguments: BlogList(
//               //       id: blogList.id,
//               //       title: blogList.title,
//               //       blogName: blogList.blogName,
//               //       imageUrl: blogList.imageUrl,
//               //       createdDateTime: blogList.createdDateTime,
//               //       category: blogList.category,
//               //       favorateNum:blogList.favorateNum,
//               //     ));
//             },
//           )
//         ],
//       ),
//     body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Blog by ${blogList.blogName ?? "Unknown"}',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               SizedBox(height: 20)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_quill/flutter_quill.dart' hide Text;
// import '../controller.dart';
// import '../widgets/widgets.dart';
// import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
// //
// //import '../controllers/blog_page_controller.dart';
// import '../widgets/widgets.dart';
// //import '../common/entities/entities.dart';
//
// class BlogDetailsScreen extends StatelessWidget {
//   final BlogList blogList;
//
//   BlogDetailsScreen(this.blogList);
//
//   final controller = Get.find<BlogPageController>();
//
//   @override
//   Widget build(BuildContext context) {
//     final quillController = QuillController.basic(
//         document: Document()..insert(0, blogList.title ?? ""));
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(blogList.title ?? "Untitled"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               Get.toNamed('/editBlog',
//                   arguments: BlogList(
//                     id: blogList.id,
//                     title: blogList.title,
//                     blogName: blogList.blogName,
//                     //createdTime: blogList.createdTime,
//                     //modifiedTime: blogList.modifiedTime,
//                   ));
//             },
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Blog by ${blogList.blogName ?? "Unknown"}',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               SizedBox(height: 16.0),
//               QuillEditor(
//                 controller: quillController,
//                 readOnly: true,
//                 expands: false,
//                 focusNode: null,
//                 scrollController: null,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_quill/flutter_quill.dart' hide Text;
// import '../controller.dart';
// import '../widgets/widgets.dart';
// import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
//
// class BlogDetailsScreen extends StatelessWidget {
//   final BlogList blogList;
//
//   BlogDetailsScreen(this.blogList);
//
//   final controller = Get.find<BlogPageController>();
//
//   @override
//   Widget build(BuildContext context) {
//     final quillController = QuillController(
//       document: Document.fromJson(this.blogList),
//       selection: TextSelection.collapsed(offset: 0),
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(blogList.title ?? "Untitled"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               Get.toNamed('/editBlog',
//                   arguments: BlogList(
//                     id: blogList.id,
//                     title: blogList.title,
//                     blogName: blogList.blogName,
//                     imageUrl: blogList.imageUrl,
//                     createdDateTime: blogList.createdDateTime,
//                     category: blogList.category,
//                     favorateNum:blogList.favorateNum,
//
//                   ));
//             },
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Blog by ${blogList.blogName ?? "Unknown"}',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               SizedBox(height: 16.0),
//               QuillEditor(
//                 controller: quillController,
//                 readOnly: true,
//                 expands: false,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




//
// import '../controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'widgets.dart';
//
// //import 'package:flutter_ducafecat_news_getx/common/entities/blog_list.dart';
// import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
// //import 'package:flutter_ducafecat_news_getx/common/utils/sqliteDBhelper.dart';
//
// //import '../../../common/entities/entities.dart';
// //import '../controller.dart';
// import 'blog_page_list.dart';
//
// //import 'blog_items_screen.dart';
// //import 'blog_list_dialog.dart';
//
// class BlogItemsScreen extends StatefulWidget {
//
//
//   final BlogList blogList;
//
//   BlogItemsScreen(this.blogList, {Key? key}) : super(key: key);
//
//   //final BlogList blogList;
//
//   @override
//   _BlogItemsScreenState createState() => _BlogItemsScreenState(this.blogList);
// }
//
// class _BlogItemsScreenState extends State<BlogItemsScreen>
//     with AutomaticKeepAliveClientMixin {
//
//   final BlogList blogList;
//
//   _BlogItemsScreenState(this.blogList);
//
//   @override
//   bool get wantKeepAlive => true;
//
//   final controller = Get.find<BlogPageController>();
//
//   //final BlogList blogList;
//
//   //late final BlogItem blogItem;
//
//   //DbHelper helper = DbHelper();
//
//   //List<BlogItem>? items;
//
//
//   //blogItem.idList = blogList.id;
//
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     //DbHelper helper = DbHelper();
//
//     //showData(this.blogList.id??3);
//     //showData(controller.state.blogList[index]);
//
//
//     return Obx(() {
//       return Scaffold(
//           appBar: AppBar(
//             title: Text(controller.state.blogItem[this.blogList.id!].title??"standard"),
//             leading: GestureDetector(
//               onTap: () {
//                 Get.back();
//               },
//               child: Icon(Icons.arrow_back_ios, size: 24,
//                   color: Colors.blue), //primaryClr),
//             ),
//           ),
//           body: ListView.builder(
//               itemCount: (controller.state.blogItem.length != null) ? controller.state.blogItem.length : 1,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(controller.state.blogItem[index].title ?? "null"),
//                   subtitle: Text(
//                       'author: ${controller.state.blogItem[index].author ??
//                           "null"} - Note:  ${controller.state.blogItem[index].content ?? "null"}'),
//                   onTap: () {},
//                   trailing: IconButton(
//                     icon: Icon(Icons.edit),
//                     onPressed: () {},),
//                 );
//               })
//       );
//     });
//   }
//



//   Future showData(int idList) async {
//     //controller.onReady();
//
//     await controller.dbHelper.openDb();
//     //items = await controller.showBlogItem(idList) ?? [];
//
//     items = await controller.showBlogItem(idList);
//     // setState(() {
//     //   items = items;
//     // });
//     print(items!.length);
//     print(controller.state.blogItem.length);
//     blogItem = (items == null)?BlogItem(id:1,
//     idList:10,
//     title:"how to reversion",
//     imageUrl:"www",
//     //image = ApiConstant.hostDlUrl + element["image"];
//     //catId = element["catId"];
//     blogName:"zzow",
//     author:"zzlovethis",
//     isFavorate:"like",
//     content:"liekwkjfai",
//     status:"good",
//     createdAt:"20220119",
//     favorateNum:20,
//     category:"chemical",
//     ):BlogItem(id:1000,
//       idList:10,
//       title:"how to reversion",
//       imageUrl:"www",
//       //image = ApiConstant.hostDlUrl + element["image"];
//       //catId = element["catId"];
//       blogName:"zzow",
//       author:"zzlovethis",
//       isFavorate:"like",
//       content:"liekwkjfai",
//       status:"good",
//       createdAt:"20220119",
//       favorateNum:20,
//       category:"chemical",
//     );
//
// }
//await controller.dbHelper.testDb();
//print(controller.dbHelper)
//blogList = await controller.dbHelper.getLists();
//controller.state.blogList.value = blogList;
//print(blogList.length);
//await helper.openDb();// setState(() {
//   items = items;
// });


