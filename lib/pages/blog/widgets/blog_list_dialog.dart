//import "dart:core";
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
//import 'package:html_editor_enhanced/html_editor.dart';

//import 'package:pull_to_refresh/pull_to_refresh.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ducafecat_news_getx/common/entities/entities.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:pull_to_refresh/pull_to_refresh.dart';

//import 'package:flutter_ducafecat_news_getx/common/utils/sqliteDBhelper.dart';
//import '../../../common/entities/blog_list.dart';
import 'package:flutter_ducafecat_news_getx/common/routers/names.dart';
import '../index.dart';
import 'blog_page_list.dart';
import 'input_field.dart';
import 'myButton.dart';
//import 'widgets.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class AddTaskPage extends StatefulWidget{
  AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {

  //final BlogPage blogPage = Get.find<BlogPage>();
  //late List<BlogList> blogList;

  //DbHelper dbHelper = DbHelper();
  final blogController = Get.find<BlogPageController>();
  // final RefreshController _refreshController =
  // Get.find().RefreshController(initialRefresh: true);
  //final refresherController = Get.find().refreshController;

  //final int lastId = 7;

  //final blogListController = Get.find<blogListController>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  //final TextEditingController _categoryController = TextEditingController();
  //final TextEditingController _favorateNumController = TextEditingController();
 final TextEditingController _blogNameController = TextEditingController();
 final TextEditingController _imageUrlController = TextEditingController();
 // final TextEditingController _createdDateTimeController = TextEditingController();
  //final HtmlEditorController controller = HtmlEditorController();

  DateTime _selectedDate = DateTime.now();

  //String _startTime = "8:30 AM";
  //String _endTime = "9:30 AM";
  //int _selectedColor = 0;
  //BlogPageList blogList;

  String? _selectedFavorateNum = '5';

  List<String?> favorateNumList = [
    '5', //good
    '10', //very good
    '15', //excellent
    '20', //perfect
  ];

  String? _selectedCategory = 'NONE';

  static List<String?> categoryList = [
    '化工',
    '安全',
    '机械',
    '电仪',
  ];
  final formKey = GlobalKey<FormState>();

  ///title,blogName,category,imageUrl,createdDatetime,favorateNum
  @override
  Widget build(BuildContext context) {

    //super.build(context);

    print("发表博客日期: " + DateFormat.yMd().format(_selectedDate));

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,

      appBar: _appBar(),

      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
              child: Form(
                key:formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputField(
                      title: "🆔号",
                      hint: (blogController.state.blogList.length+1).toString() + "  must be more than this number",
                      controller: _idController,
                      onSaved: () {},
                      validator: () {},
                      // validator: (value) {
                      //   return (value != null ) ? 'input the ID number.' : null;
                      // },
                      // onSaved: (String? value) {
                      //   // This optional block of code can be used to run
                      //   // code when the user saves the form.
                      // },
                    //validator: (String? value) {
                //   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                // },/

                    ),

                    InputField(
                      title: "博客标题",
                      hint: "Enter title here.can't null",
                      controller: _titleController,
                      onSaved: (){},
                      validator: (){},
                    ),

                    InputField(
                      title: "博客作者",
                      hint: "Enter BlogName here.can't null",
                      controller: _blogNameController,
                      onSaved: (){},
                      validator: (){},),

                    InputField(
                      title: "博客内容",
                      hint: "Enter BLOG CONTENT.can't null",
                      controller: _contentController,
                      onSaved: (){},
                      validator: (){},),

                     // HtmlEditor(
                     //    controller: controller,
                     //    htmlEditorOptions: HtmlEditorOptions(
                     //    hint: "You can write your article here...",
                     //    shouldEnsureVisible: true,
                     //    initialText: "this is description about this techBlog ."
                     //   ),
                     //   // callbacks: Callbacks(
                     //   //   onChangeContent: (val) {
                     //   //      = val;
                     //   //   }
                     //
                     //       //log(manageArticleController.articleInfoModel.value.content.toString());
                     //
                     // ),

                    // HtmlWidget(
                    //   blogController.state.blogList[int.parse(_idController.text)].imageUrl,
                    //   //textStyle: textThem.headline5,
                    //   enableCaching: true,
                    //   onLoadingBuilder: (context, element, loadingProgress) => Loading(),
                    // ),


                    InputField(
                      title: "图片地址",
                      hint: "Enter imageUrl address here.",
                      controller: _imageUrlController,
                      onSaved: (){},
                      validator: (){},),

                    InputField(
                      onSaved: (){},
                      validator: (){},
                          title: "日期（年月日）",
                          hint: DateFormat.yMd().format(_selectedDate),
                          //controller: _createdDateTimeController,
                          widget: IconButton(
                            icon: (Icon(
                              Icons.eighteen_mp_outlined,
                              color: Colors.grey,
                            )),
                            onPressed: () {
                              //_showDatePicker(context);
                               _getDateFromUser();
                            },
                          ),
                        ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: InputField(
                    //         title: "开始时间（几点几分）",
                    //         hint: _startTime,
                    //         widget: IconButton(
                    //           icon: (Icon(
                    //             Icons.access_alarm,
                    //             color: Colors.grey,
                    //           )),
                    //           onPressed: () {
                    //             _getTimeFromUser(isStartTime: true);
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 12,
                    //     ),
                    //     // Expanded(
                    //     //   child: InputField(
                    //     //     title: "结束时间（几点几分）",
                    //     //     hint: _endTime,
                    //     //     widget: IconButton(
                    //     //       icon: (Icon(
                    //     //         Icons.abc_sharp,
                    //     //         color: Colors.grey,
                    //     //       )),
                    //     //       onPressed: () {
                    //     //         _getTimeFromUser(isStartTime: false);
                    //     //       },
                    //     //     ),
                    //     //   ),
                    //     // )
                    //   ],
                    // ),
                    InputField(
                      onSaved: (){},
                      validator: (){},
                      title: "选择喜爱程度数值",
                      //controller: _favorateNumController,
                      hint: "$_selectedFavorateNum",
                      widget: Row(
                        children: [
                          DropdownButton<String>(
                              //value: _selectedFavorateNum,//发现如填上的话，导致多值。
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              iconSize: 32,
                              elevation: 4,
                              //style: subTitleTextStle,
                              underline: Container(height: 0),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedFavorateNum = value!;
                                });
                                //_selectedFavorateNum = value;
                              },
                              items: favorateNumList
                                  .map<DropdownMenuItem<String>>((String? value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value!),
                                );
                              }).toList()),
                          SizedBox(width: 6),
                        ],),),


                    InputField(
                      onSaved: (){},
                      validator: (){},
                      title: "分类",
                      hint: "$_selectedCategory",
                      //controller: _categoryController,
                      widget: Row(
                        children: [
                          DropdownButton<String>(
                            //value: _selectedCategory,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              iconSize: 32,
                              elevation: 4,
                              //style: subTitleTextStle,
                              underline: Container(height: 0),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCategory = newValue!;
                                });
                                //_selectedCategory = newValue;

                              },
                              items: categoryList
                                  .map<DropdownMenuItem<String>>((String? value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value!),
                                );
                              }).toList()),
                          SizedBox(width: 6),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 18.0,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SizedBox(
                          height: 10.0,
                        ),
                        MyButton(
                          label: "博客上新",
                          onTap: () {
                            //print("OK?");
                            //_addBlogListToDB();
                            // Future.delayed(Duration.zero,(){
                            //   Get.to(()=>BlogPageList());
                            // });
                            _validateInputs();
                          },
                        ),
                      ],
                    )

                  ],
                ),
              ),

          )
      ),
    );
  }

  _validateInputs() {
    if (_titleController.text.isNotEmpty
        && _blogNameController.text.isNotEmpty
        && _imageUrlController.text.isNotEmpty
        //&& _selectedDate != null
        //&& _selectedFavorateNum!.isNotEmpty
        //&& _selectedCategory!.isNotEmpty

        //&& _createdDateTimeController.text.isNotEmpty
        // && _idController.text.isNotEmpty
    //_selectedCategory!.isNotEmpty && _selectedFavorateNum!.isNotEmpty && _selectedDate.toString().isNotEmpty
    ) {
      //print(_favorateNumController.text.isNotEmpty);
      //print(_categoryController.text.isNotEmpty);
      //print(_createdDateTimeController.text.isNotEmpty);
      _addBlogListToDB();
      // Future.delayed(Duration.zero,(){
      //   _addBlogListToDB();});
        //Get.to(()=>BlogPageList());
     //_addBlogListToDB();

    //debugPrint("YES????");

      Future.delayed(Duration.zero,(){
        Get.to(()=>BlogPageList());
       });
      //Get.offAndToNamed('/blogList');
      //Get.toNamed('/blogList');
      //Get.toNamed(AppRoutes.Blog);
      //Navigator.pop(context);
    } else if (_titleController.text.isNotEmpty
        ||_blogNameController.text.isNotEmpty
        ||_imageUrlController.text.isNotEmpty
        //_favorateNumController.text.isNotEmpty
        //||_categoryController.text.isNotEmpty
    //||_createdDateTimeController.text.isNotEmpty
        // ||_createdDateTimeController.text.isNotEmpty
        // ||_idController.text.isNotEmpty
    ) {
      print("NO???");
      Get.snackbar(
        "Required",
        "All fields are required.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      print("############ SOMETHING BAD HAPPENED #################");
    }
  }

  _addBlogListToDB() {
    //this._favorateNumController.text = _selectedFavorateNum!;
    //this._categoryController.text = _selectedCategory!;
    blogController.createBlogList(
        BlogList(
          id:int.parse(_idController.text),
          title:_titleController.text,
          category:_selectedCategory,//_categoryController.text,//_selectedCategory,
          blogName:_blogNameController.text,
          favorateNum:int.parse(_selectedFavorateNum??"10"),//_selectedFavorateNum!
          imageUrl:_imageUrlController.text,
          createdDateTime:DateFormat.yMd().format(_selectedDate),
          content:_contentController.text,
        ));
    print("$_idController.text");
    print("$_blogNameController.text");
    print("$_selectedFavorateNum.text");
    print("$_selectedCategory.text");
    print("$_selectedDate.text");
    print("$_titleController.text");
    print("$_imageUrlController.text");

    //blogController.fetchBlogList();
    //print(_favorateNumController.text);
    //print(_categoryController.text);
    print("insert database");
    Get.back();
  }

  // bool validateDate() {
  //   if (titleController.text.isEmpty ||
  //       noteController.text.isEmpty) {
  //     Get.snackbar(
  //       'Required',
  //       'All fields are required!',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.orange.withOpacity(0.5),
  //       icon: const Icon(
  //         Icons.warning_amber_rounded,
  //         color: Colors.red,
  //       ),
  //     );
  //     return false;
  //   }
  //   return true;
  // }
  //
  // void addTasksToDB() async {
  //   if (validateDate()) {
  //     int value = await taskController.addTasks(task: Task(
  //       title: titleController.text,
  //       note: noteController.text,
  //       isCompleted: 0,
  //       date: DateFormat.yMd().format(selectedDate),
  //       startTime: startTime,
  //       endTime: endTime,
  //       color: _selectedColor,
  //       remind: selectedRemind,
  //       repeat: selectedRepeat,
  //     ),);
  //     Get.back();
  //     taskController.getTasks();
  //     print('return value is : $value');
  //   }else{
  //     print('Error Occurred');
  //   }
  // }

  _appBar() {
    //这部分功能目前是实现了的
    return AppBar(
        elevation: 3,
        backgroundColor: context.theme.backgroundColor, //Colors.amber,//
        leading: GestureDetector(
          onTap: () {
            Future.delayed(Duration.zero,(){
              Get.to(()=>BlogPageList());
            });
            //Get.to(()=>BlogPageList());
            //Get.back();
          },
          child: Icon(Icons.arrow_back_ios, size: 24,
              color: Colors.blue), //primaryClr),
        ),
        actions: [
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage("images/girl.jpg"),
          ),
          SizedBox(
            width: 20,
          ),
        ]);
  }


  _getDateFromUser() async {
    final DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101)
    );
    if (_pickedDate != null) {
      setState(() {
        _selectedDate = _pickedDate;
      });
      //_selectedDate = _pickedDate;
    }
    print("$_selectedDate");
  }
}



