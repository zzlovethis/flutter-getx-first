import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
import 'package:flutter_ducafecat_news_getx/common/values/values.dart';
import 'package:flutter_ducafecat_news_getx/common/widgets/widgets.dart';
import 'package:flutter_ducafecat_news_getx/pages/category/index.dart';
import 'package:flutter_ducafecat_news_getx/pages/main/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

// class CounterPage extends GetView<CounterController> {
//   //final controller = Get.find<CounterController>();
//
//   @override
//   Widget build(BuildContext context) {
//     //return _buildPageView();
//     // return GetX<CounterController>(
//     //   init: controller,
//     //   initState: (_) {},
//     //   builder: (logic) {
//     return Scaffold(
//       //appBar: _buildAppBar(),
//       body: _buildPageView(),
//       //bottomNavigationBar: _buildBottomNavigationBar(),
//     );
//
//     //     return Scaffold(
//     //       //appBar: _buildAppBar(),
//     //       body: _buildPageView(),
//     //       //bottomNavigationBar: _buildBottomNavigationBar(),
//     //     );
//     //
//   }
//
//   // 内容页
//   Widget _buildPageView() {
//     return Padding(
//       padding: const EdgeInsets.all(0),
//       child: Container(
//         decoration: BoxDecoration(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Social Chefs 👩‍🍳',
//               style: TextStyle(fontSize: 20),
//               //style: Theme.of(context).textTheme.headline1,
//             ),
//             const SizedBox(height: 16),
//             // Text(
//             //   '${controller.state.fetchMovie()}',
//             //   //style: Theme.of(context).textTheme.headline1,
//             // ),
//             FloatingActionButton(
//               onPressed: () {
//                 controller.fetchMovie();
//               },
//               child: Text(
//                 'Fetch',
//                 style: TextStyle(fontSize: 15),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Obx(() {
//               return Text(
//                 '${controller.state.counter}',
//                 style: TextStyle(fontSize: 20),
//                 //style: Theme.of(context).textTheme.headline1,
//               );
//             }),
//             const SizedBox(height: 16),
//             FloatingActionButton(
//               onPressed: () {
//                 controller.state.increment();
//               },
//               child: Text(
//                 '+++',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Obx(() {
//               return Text(
//                 '{${controller.state.movies[int.parse(
//                     '${controller.state.counter}')].title}',
//                 style: TextStyle(fontSize: 20),
//                 //style: Theme.of(context).textTheme.headline1,
//               );
//             }),
//             const SizedBox(height: 16),
//             Obx(() {
//               return Text(
//                 '${controller.state.movies[int.parse(
//                     '${controller.state.counter}')].genres}',
//                 style: TextStyle(fontSize: 20),
//                 //style: Theme.of(context).textTheme.headline1,
//               );
//             }),
//             //MoviePageList(),
//
//             // Text(
//             //   '${}',
//             //   //style: Theme.of(context).textTheme.headline1,
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MoviePageList extends StatefulWidget {
  MoviePageList({Key? key}) : super(key: key);

  @override
  _MoviePageListState createState() => _MoviePageListState();
}

class _MoviePageListState extends State<MoviePageList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetX<CounterController>(
      init: controller,
      builder: (controller) =>
          SmartRefresher(
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
                        var item = controller.state.movies[index];
                        return MoviesItem(item);
                        //return Container(
                          //margin: EdgeInsets.all(2),
                        //   child: Text(
                        //     item.title ?? "----",
                        //     style: TextStyle(
                        //       fontFamily: 'Avenir',
                        //       fontWeight: FontWeight.normal,
                        //       color: Colors.black,
                        //       fontSize: 15.sp,
                        //       height: 1,
                        //     ),
                        //   ),
                        // );
                      },
                      childCount: controller.state.movies.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
Widget MoviesItem(Movie item) {
  return Container(
    height: 161.h,
    padding: EdgeInsets.all(20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 图
        // InkWell(
        //   onTap: () {
        //     // ExtendedNavigator.rootNavigator.pushNamed(
        //     //   Routes.detailsPageRoute,
        //     //   arguments: DetailsPageArguments(item: item),
        //     // );
        //   },
        //   child: netImageCached(
        //     item.thumbnail ?? "",
        //     width: 121.w,
        //     height: 121.w,
        //   ),
        // ),
        // 右侧
        SizedBox(
          width: 194.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 作者
              Container(
                margin: EdgeInsets.all(0),
                child: Text(
                  item.title ?? "---",
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.thirdElementText,
                    fontSize: 14.sp,
                    height: 1,
                  ),
                ),
              ),
              // 标题
              InkWell(
                onTap: () {
                  // ExtendedNavigator.rootNavigator.pushNamed(
                  //   Routes.detailsPageRoute,
                  //   arguments: DetailsPageArguments(item: item),
                  // );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Text(
                    item.runtime ?? "",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                      fontSize: 16.sp,
                      height: 1,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 3,
                  ),
                ),
              ),
              // Spacer
              Spacer(),
              // 一行 3 列
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // 分类
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 60.w,
                      ),
                      child: Text(
                        item.runtime ?? "",
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.normal,
                          color: AppColors.secondaryElementText,
                          fontSize: 14.sp,
                          height: 1,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    // 添加时间
                    Container(
                      width: 15.w,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 100.w,
                      ),
                      child: Text(
                        '${item.runtimeType}',
                        //'• ${duTimeLineFormat(item.addtime ?? DateTime(0))}',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.normal,
                          color: AppColors.thirdElementText,
                          fontSize: 14.sp,
                          height: 1,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    // 更多
                    Spacer(),
                    InkWell(
                      child: Icon(
                        Icons.more_horiz,
                        color: AppColors.primaryText,
                        size: 24.sp,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Widget MoviesItem(item) {
//   return Container(
//     height: 160.h,
//     padding: EdgeInsets.all(5.w),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         // 图
//         // InkWell(
//         //   onTap: () {
//         //     // ExtendedNavigator.rootNavigator.pushNamed(
//         //     //   Routes.detailsPageRoute,
//         //     //   arguments: DetailsPageArguments(item: item),
//         //     // );
//         //   },
//         //   child: netImageCached(
//         //     item.title ?? "",
//         //     width: 121.w,
//         //     height: 121.w,
//         //   ),
//         // ),
//         // 右侧
//         SizedBox(
//           width: 60.w,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               // 作者
//               Container(
//                 margin: EdgeInsets.all(10),
//                 child: Text(
//                   item.title ?? "",
//                   style: TextStyle(
//                     fontFamily: 'Avenir',
//                     fontWeight: FontWeight.normal,
//                     color: AppColors.thirdElementText,
//                     fontSize: 15.sp,
//                     height: 10,
//                   ),
//                 ),
//               ),
//               // 标题
//               // InkWell(
//               //   onTap: () {
//               //     // ExtendedNavigator.rootNavigator.pushNamed(
//               //     //   Routes.detailsPageRoute,
//               //     //   arguments: DetailsPageArguments(item: item),
//               //     // );
//               //   },
//               //   child: Container(
//               //     margin: EdgeInsets.only(top: 10.h),
//               //     child: Text(
//               //       item.runtime ?? "",
//               //       style: TextStyle(
//               //         fontFamily: 'Montserrat',
//               //         fontWeight: FontWeight.w500,
//               //         color: AppColors.primaryText,
//               //         fontSize: 16.sp,
//               //         height: 1,
//               //       ),
//               //       overflow: TextOverflow.clip,
//               //       maxLines: 3,
//               //     ),
//               //   ),
//               // ),
//               // Spacer
//                Spacer(),
//               // // 一行 3 列
//               Container(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     // 分类
//                     ConstrainedBox(
//                       constraints: BoxConstraints(
//                         maxWidth: 60.w,
//                       ),
//                       child: Text(
//                         item.genres ?? "",
//                         style: TextStyle(
//                           fontFamily: 'Avenir',
//                           fontWeight: FontWeight.normal,
//                           color: AppColors.secondaryElementText,
//                           fontSize: 14.sp,
//                           height: 1,
//                         ),
//                         overflow: TextOverflow.clip,
//                         maxLines: 1,
//                       ),
//                     ),
//
//                     // 添加时间
//                     // Container(
//                     //   width: 15.w,
//                     // ),
//               //       // ConstrainedBox(
//               //       //   constraints: BoxConstraints(
//               //       //     maxWidth: 100.w,
//               //       //   ),
//               //       //   child: Text(
//               //       //     '• ${duTimeLineFormat( ?? DateTime(0))}',
//               //       //    style: TextStyle(
//               //       //       fontFamily: 'Avenir',
//               //       //       fontWeight: FontWeight.normal,
//               //       //       color: AppColors.thirdElementText,
//               //       //       fontSize: 14.sp,
//               //       //       height: 1,
//               //       //     ),
//               //       //     overflow: TextOverflow.clip,
//               //       //     maxLines: 1,
//               //       //   ),
//               //       // ),
//               //       // 更多
//               //       Spacer(),
//               //       // InkWell(
//               //       //   child: Icon(
//               //       //     Icons.more_horiz,
//               //       //     color: AppColors.primaryText,
//               //       //     size: 24.sp,
//               //       //   ),
//               //       //   onTap: () {},
//               //       // ),
//               //     ],
//               //   ),
//               // ),
//
//
//
// //       ListView.separated(
// //           primary: false,
// //           physics: const NeverScrollableScrollPhysics(),
// //           shrinkWrap: true,
// //           scrollDirection: Axis.vertical,
// //           itemCount: controller.state.movies.length,
// //           itemBuilder: (context, index) {
// //             final post = controller.state.movies[index];
// //             return Row(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: [
// //                 // CircleImage(
// //                 //   imageProvider: AssetImage('${post.profileImageUrl}'),
// //                 //   imageRadius: 20,
// //                 // ),
// //                 const SizedBox(width: 16),
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text('${controller.state.movies.length}',
// //                           style: TextStyle(
// //                             color: Colors.black,
// //                             fontSize: 40,
// //                           )),
// //                       // Text(
// //                       //   '${post.year} mins ago',
// //                       //   style: Theme
// //                       //       .of(context)
// //                       //       .textTheme
// //                       //       .bodyText1,
// //                       // ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             );
// //           },
// //           separatorBuilder: (context, index) {
// //             return const SizedBox(height: 16);
// //           },
// //         ),
// //       const SizedBox(height: 16),
// //     ],
// //   ),
// // );
// // return CustomScrollView(
// //   slivers: [
// //     SliverPadding(
// //       padding: EdgeInsets.symmetric(
// //         vertical: 1.w,
// //         horizontal: 1.w,
// //       ),
// //       sliver: SliverList(
// //         delegate: SliverChildBuilderDelegate(
// //               (content, index) {
// //             var item = controller.state.movies[index];
// //             return Container(
// //               height: 161.h,
// //               padding: EdgeInsets.all(20.w),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: <Widget>[
// //                   // 图
// //                   // InkWell(
// //                   //   onTap: () {
// //                   //     // ExtendedNavigator.rootNavigator.pushNamed(
// //                   //     //   Routes.detailsPageRoute,
// //                   //     //   arguments: DetailsPageArguments(item: item),
// //                   //     // );
// //                   //   },
// //                   //   child: netImageCached(
// //                   //     item.title ?? "",
// //                   //     width: 121.w,
// //                   //     height: 121.w,
// //                   //   ),
// //                   // ),
// //                   // 右侧
// //                   SizedBox(
// //                     width: 120.w,
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: <Widget>[
// //                         // 作者
// //                         Container(
// //                           margin: EdgeInsets.all(5),
// //                           child: Text(
// //                             item.title ?? "",
// //                             style: TextStyle(
// //                               fontFamily: 'Avenir',
// //                               fontWeight: FontWeight.normal,
// //                               color: AppColors.thirdElementText,
// //                               fontSize: 14.sp,
// //                               height: 1,
// //                             ),
// //                           ),
// //                         ),
// //                         // 标题
// //                         // InkWell(
// //                         //   onTap: () {
// //                         //     // ExtendedNavigator.rootNavigator.pushNamed(
// //                         //     //   Routes.detailsPageRoute,
// //                         //     //   arguments: DetailsPageArguments(item: item),
// //                         //     // );
// //                         //   },
// //                         //   child: Container(
// //                         //     margin: EdgeInsets.only(top: 10.h),
// //                         //     child: Text(
// //                         //       item.title ?? "",
// //                         //       style: TextStyle(
// //                         //         fontFamily: 'Montserrat',
// //                         //         fontWeight: FontWeight.w500,
// //                         //         color: AppColors.primaryText,
// //                         //         fontSize: 16.sp,
// //                         //         height: 1,
// //                         //       ),
// //                         //       overflow: TextOverflow.clip,
// //                         //       maxLines: 3,
// //                         //     ),
// //                         //   ),
// //                         // ),
// //                         // Spacer
// //                         Spacer(),
// //                         // 一行 3 列
// //                         Container(
// //                           child: Row(
// //                             crossAxisAlignment:
// //                             CrossAxisAlignment.center,
// //                             children: <Widget>[
// //                               // 分类
// //                               ConstrainedBox(
// //                                 constraints: BoxConstraints(
// //                                   maxWidth: 60.w,
// //                                 ),
// //                                 child: Text(
// //                                   item.runtime ?? "",
// //                                   style: TextStyle(
// //                                     fontFamily: 'Avenir',
// //                                     fontWeight: FontWeight.normal,
// //                                     color:
// //                                     AppColors.secondaryElementText,
// //                                     fontSize: 14.sp,
// //                                     height: 1,
// //                                   ),
// //                                   overflow: TextOverflow.clip,
// //                                   maxLines: 1,
// //                                 ),
// //                               ),
// //                               // 添加时间
// //                               Container(
// //                                 width: 15.w,
// //                               ),
// //                               // ConstrainedBox(
// //                               //   constraints: BoxConstraints(
// //                               //     maxWidth: 100.w,
// //                               //   ),
// //                               //   child: Text(
// //                               //     '• ${duTimeLineFormat(item.addtime ?? DateTime(0))}',
// //                               //     style: TextStyle(
// //                               //       fontFamily: 'Avenir',
// //                               //       fontWeight: FontWeight.normal,
// //                               //       color: AppColors.thirdElementText,
// //                               //       fontSize: 14.sp,
// //                               //       height: 1,
// //                               //     ),
// //                               //     overflow: TextOverflow.clip,
// //                               //     maxLines: 1,
// //                               //   ),
// //                               // ),
// //                               // 更多
// //                               Spacer(),
// //                               InkWell(
// //                                 child: Icon(
// //                                   Icons.more_horiz,
// //                                   color: AppColors.primaryText,
// //                                   size: 24.sp,
// //                                 ),
// //                                 onTap: () {},
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           },
// //           childCount: controller.state.movies.length,
// //         ),
// //       ),
// //     ),
// //   ],
// // );
// //
// // Column(
// // mainAxisAlignment: MainAxisAlignment.center,
// // crossAxisAlignment: CrossAxisAlignment.center,
// // children: [
// //
// // Obx(
// //   () => Text(
// //     '${controller.state.counter}',
// //     style: TextStyle(
// //       color: AppColors.primaryText,
// //       fontFamily: 'Montserrat',
// //       fontSize: 20.sp,
// //       fontWeight: FontWeight.w600,
// //     ),
// //   ),
// // ),
// // SizedBox(
// //   height: 30.0,
// // ),
// // IconButton(
// //   //constraints:BoxDecoration.lerp(a, b, t)
// //   icon: Icon(
// //     Icons.add,
// //     color: AppColors.primaryText,
// //   ),
// //   onPressed: () {
// //     controller.state.increment();
// //   },
// // ),
// // SizedBox(
// //   height: 20.0,
// // ),
// //
// // Obx(()=>Text(
// //   '${controller.get()}',
// // style: TextStyle(
// // color: AppColors.primaryText,
// // fontFamily: 'Montserrat',
// // fontSize: 15.sp,
// // fontWeight: FontWeight.w600,
// // ),
// // ),),
// //
// // ListView.separated(
// // scrollDirection: Axis.horizontal,
// // itemCount: recipes.length,
// // itemBuilder: (context, index) {
// // final recipe = recipes[index];
// // return buildCard(recipe);
// // },
// // separatorBuilder: (context, index) {
// // return const SizedBox(width: 16);
// // },
// // ],
// // );
// // controller: controller,
// // onPageChanged: controller.,
// // }
// //
// // 底部导航
// // Widget _buildBottomNavigationBar() {
// //   return Obx(() => BottomNavigationBar(
// //         items: controller.bottomTabs,
// //         currentIndex: controller.state.page,
// //         // fixedColor: AppColors.primaryElement,
// //         type: BottomNavigationBarType.fixed,
// //         onTap: controller.handleNavBarTap,
// //         showSelectedLabels: false,
// //         showUnselectedLabels: false,
// //       ));
// // 顶部导航
// // AppBar _buildAppBar() {
// //   return transparentAppBar(
// //       title: Obx(() =>
// //           Text(
// //             'controller.state.counter',
// //             style: TextStyle(
// //               color: AppColors.primaryText,
// //               fontFamily: 'Montserrat',
// //               fontSize: 18.sp,
// //               fontWeight: FontWeight.w600,
// //             ),
// //           )),
// //       actions: <Widget>[
// //         IconButton(
// //           icon: Icon(
// //             Icons.add,
// //             color: AppColors.primaryText,
// //           ),
// //           onPressed: () {
// //             controller.state.increment();
// //           },
// //         )
// //       ]);
// // }
