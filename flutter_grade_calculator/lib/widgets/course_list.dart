import 'package:flutter/material.dart';
import 'package:flutter_grade_calculator/constants/app_constants.dart';
import 'package:flutter_grade_calculator/helper/data_helper.dart';
import 'package:flutter_grade_calculator/models/course.dart';

class CourseList extends StatelessWidget {

  final Function onDismiss;
  const CourseList({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Course> allCourses = DataHelper.allAddedCourses;
    return allCourses.length > 0 ?  ListView.builder(itemCount: allCourses.length, itemBuilder: (context, index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (a){
          onDismiss(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
              title: Text(allCourses[index].name,style: TextStyle(color: Constants.mainColor),),
              leading: CircleAvatar(
                backgroundColor: Constants.mainColor.shade100,
                child: Text("${allCourses[index].name[0].toUpperCase()}"),
              ),
              subtitle: Text("${allCourses[index].credit} Credits, Grade ${allCourses[index].letter}"),
            ),
          ),
        ),
      );
    })
        : Container(
            child: Center(child: Text("Please add a course. ", style: Constants.headerStyle,)),
        );
  }
}
