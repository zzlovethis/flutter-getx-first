import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/pages/blog/index.dart';
import 'package:get/get.dart';
//import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
//import 'package:flutter_icons/flutter_icons.dart';

import '../../../common/entities/entities.dart';
//import 'input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BlogItemAddTaskPage extends StatefulWidget {

  @override
  _BlogItemAddTaskPageState createState() => _BlogItemAddTaskPageState();

}




class _BlogItemAddTaskPageState extends State<BlogItemAddTaskPage> {

  final BlogPageController blogListController = Get.find<BlogPageController>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _favorateNumController = TextEditingController();
  final TextEditingController _blogNameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _createdDateTimeController = TextEditingController();


  DateTime _selectedDate = DateTime.now();

  String _startTime = "8:30 AM";
  String _endTime = "9:30 AM";
  int _selectedColor = 0;

  String? _selectedFavorateNum = "5";

  List<String?> favorateNumList = [
    "5",//good
    "10",//very good
    "15",//excellent
    "20",//perfect
  ];

  String _selectedCategory = 'NONE';

  List<String> categoryList = [
    '化工',
    '安全',
    '机械',
    '电仪',
  ];


  ///title,blogName,category,imageUrl,createdDatetime,favorateNum
  @override
  Widget build(BuildContext context) {
    print("add Task date: " + DateFormat.yMd().format(_selectedDate));
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      //appBar: _appBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Task",
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 8,
              ),
              InputField(
                title: "Title",
                hint: "Enter title here.",
                controller: _titleController,
              ),
              InputField(
                  title: "BlogName",
                  hint: "Enter BlogName here.",
                  controller: _blogNameController),
              InputField(
                  title: "imageUrl",
                  hint: "Enter imageUrl address here.",
                  controller: _imageUrlController),
              InputField(
                title: "Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: (Icon(
                    FlutterIcons.calendar_ant,
                    color: Colors.grey,
                  )),
                  onPressed: () {
                    //_showDatePicker(context);
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: "Start Time",
                      hint: _startTime,
                      widget: IconButton(
                        icon: (Icon(
                          FlutterIcons.clock_faw5,
                          color: Colors.grey,
                        )),
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: InputField(
                      title: "End Time",
                      hint: _endTime,
                      widget: IconButton(
                        icon: (Icon(
                          FlutterIcons.clock_faw5,
                          color: Colors.grey,
                        )),
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                      ),
                    ),
                  )
                ],
              ),
              InputField(
                title: "favorateNum",
                hint: "$_selectedFavorateNum good very good excellent perfect",
                widget: Row(
                  children: [
                    DropdownButton<String>(
                        value: _selectedFavorateNum,
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
                            _selectedFavorateNum = newValue;
                          });
                        },
                        items: favorateNumList
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
              InputField(
                title: "category",
                hint: _selectedCategory,
                widget: Row(
                  children: [
                    DropdownButton<String>(
                      //value: _selectedRemind.toString(),
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
                        },
                        items: categoryList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
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
                  _colorChips(),
                  MyButton(
                    label: "Create Task",
                    onTap: () {
                      _validateInputs();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validateInputs() {
    if (_titleController.text.isNotEmpty && _blogNameController.text.isNotEmpty) {
      _addBlogListToDB();
      Get.back();
    } else if (_titleController.text.isEmpty || _blogNameController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All fields are required.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      print("############ SOMETHING BAD HAPPENED #################");
    }
  }

  _addBlogListToDB() async {
    await blogListController.creatBlogList(BlogList(
      title: _titleController.text,
      category: _categoryController.text,
      createdDateTime: _selectedDate,
      favorateNum: int.parse(_favorateNumController.text),
      imageUrl: _imageUrlController.text,
    ),
    );
  }

  _colorChips() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Color",
        style: titleTextStle,
      ),
      SizedBox(
        height: 8,
      ),
      Wrap(
        children: List<Widget>.generate(
          3,
              (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? primaryClr
                      : index == 1
                      ? pinkClr
                      : yellowClr,
                  child: index == _selectedColor
                      ? Center(
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 18,
                    ),
                  )
                      : Container(),
                ),
              ),
            );
          },
        ).toList(),
      ),
    ]);
  }

  // _appBar() {
  //   return AppBar(
  //       elevation: 0,
  //       backgroundColor: context.theme.backgroundColor,
  //       leading: GestureDetector(
  //         onTap: () {
  //           Get.back();
  //         },
  //         child: Icon(Icons.arrow_back_ios, size: 24, color: primaryClr),
  //       ),
  //       actions: [
  //         CircleAvatar(
  //           radius: 16,
  //           backgroundImage: AssetImage("images/girl.jpg"),
  //         ),
  //         SizedBox(
  //           width: 20,
  //         ),
  //       ]);
  // }

  // _compareTime() {
  //   print("compare time");
  //   print(_startTime);
  //   print(_endTime);

  //   var _start = double.parsestartTime);
  //   var _end = toDouble(_endTime);

  //   print(_start);
  //   print(_end);

  //   if (_start > _end) {
  //     Get.snackbar(
  //       "Invalid!",
  //       "Time duration must be positive.",
  //       snackPosition: SnackPosition.BOTTOM,
  //       overlayColor: context.theme.backgroundColor,
  //     );
  //   }
  // }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  _getTimeFromUser({@required bool? isStartTime}) async {
    var _pickedTime = await _showTimePicker();
    print(_pickedTime.format(context));
    String _formatedTime = _pickedTime.format(context);
    print(_formatedTime);
    if (_pickedTime == null)
      print("time canceld");
    else if (isStartTime!)
      setState(() {
        _startTime = _formatedTime;
      });
    else if (!isStartTime) {
      setState(() {
        _endTime = _formatedTime;
      });
      //_compareTime();
    }
  }

  _showTimePicker() async {
    return showTimePicker(
      initialTime: TimeOfDay(hour: 8, minute: 30),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    );
  }

  _getDateFromUser() async {
    final DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (_pickedDate != null) {
      setState(() {
        _selectedDate = _pickedDate;
      });
    }
  }
}

class MyButton extends StatelessWidget {
  final Function? onTap;
  final String? label;

  MyButton({
    this.onTap,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 50,
        width: 130,
        decoration: BoxDecoration(
          color: primaryClr,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            label!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    orientation = _mediaQueryData?.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double? screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight!;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double? screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth!;
}

const Color purpleClr = Color(0xFFA0338A);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFF54B80);

const primaryClr = purpleClr;
const Color darkGreyClr = Color(0xFF121212);
Color? darkHeaderClr = Colors.grey[800];

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.grey[100],
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
    primaryColor: primaryClr,
  );
}

TextStyle get headingTextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get subHeadingTextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.grey[400] : Colors.grey),
  );
}

TextStyle get titleTextStle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get subTitleTextStle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 16,
        color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[700]),
  );
}

TextStyle get bodyTextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle get body2TextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.grey[200] : Colors.grey[600]),
  );
}


// class BlogItemDialog  {
//   final txtName = TextEditingController();
//   final txtQuantity = TextEditingController();
//   final txtNote = TextEditingController();
//   Widget buildAlert(BuildContext context, ListItem item, bool isNew) {
//     DbHelper helper = DbHelper();
//     helper.openDb();
//     if (!isNew) {
//       txtName.text = item.name;
//       txtQuantity.text = item.quantity;
//       txtNote.text = item.note;
//     }
//     return AlertDialog(
//       title: Text((isNew)?'New shopping item':'Edit shopping item'),
//       content: SingleChildScrollView(
//         child: Column(children: <Widget>[
//           TextField(
//             controller: txtName,
//             decoration: InputDecoration(
//               hintText: 'Item Name'
//             )
//           ),
//           TextField(
//             controller: txtQuantity,
//             decoration: InputDecoration(
//               hintText: 'Quantity'
//             ) ,
//           ),
//           TextField(
//             controller: txtNote,
//             decoration: InputDecoration(
//               hintText: 'Note'
//             ) ,
//           ),
//           RaisedButton(
//             child: Text('Save Item'),
//             onPressed: (){
//                 item.name = txtName.text;
//                 item.quantity = txtQuantity.text;
//                 item.note = txtNote.text;
//                 helper.insertItem(item);
//                 Navigator.pop(context);
//             },
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30.0)
//             )  )   ],),      ),    );  }}