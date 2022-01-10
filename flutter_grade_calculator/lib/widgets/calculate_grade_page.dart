import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grade_calculator/constants/app_constants.dart';
import 'package:flutter_grade_calculator/helper/data_helper.dart';
import 'package:flutter_grade_calculator/models/course.dart';
import 'package:flutter_grade_calculator/widgets/credits_dropdown_widget.dart';
import 'package:flutter_grade_calculator/widgets/letter_dropdown_widget.dart';
import 'package:flutter_grade_calculator/widgets/show_average.dart';

import 'course_list.dart';

class CalculateGradePage extends StatefulWidget {
  const CalculateGradePage({Key? key}) : super(key: key);

  @override
  State<CalculateGradePage> createState() => _CalculateGradePageState();
}

class _CalculateGradePageState extends State<CalculateGradePage> {
  var formKey = GlobalKey<FormState>();
  double selectedValue = 4;
  double selectedCredits = 1;
  String selectedCourse = "";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(Constants.appBarHeader,style: Constants.headerStyle,),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: _buildForm()
                ),
                Expanded(
                    flex: 1,
                    child: ShowAverage(average: DataHelper.calculateAverage(),classCount: DataHelper.allAddedCourses.length,)
                )
              ],
            ),
            Expanded(
              child: CourseList(
                onDismiss: (index){
                  setState(() {
                    DataHelper.allAddedCourses.removeAt(index);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Constants.horizontalPadding,
            child: _buildTextFormField(),
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Constants.horizontalPadding,
                  child: LetterDropdownWidget(
                    onLetterSelected: (letter){
                      selectedValue = letter;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constants.horizontalPadding,
                  child: CreditsDropdownWidget(
                    onCreditsSelected: (credit){
                      selectedCredits = credit;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _addCourseAndCalculateAverage,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Constants.mainColor,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (value){
        setState(() {
          selectedCourse = value!;
        });
      },
      validator: (s){
        if(s!.length <= 0){
          return "Enter a course name!";
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Math",
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Constants.mainColor.shade100.withOpacity(0.5),
      ),
    );
  }


  void _addCourseAndCalculateAverage() {
    formKey.currentState!.save();
    if(formKey.currentState!.validate()){
      var course = Course(
          name: selectedCourse,
          letter: selectedValue,
          credit: selectedCredits);
      DataHelper.addCourse(course);
      setState(() {

      });
    }
  }

  // CUPERTINO PICKER
  /*
  _buildLettsersIOS(){
    return Container(
      child: Expanded(
        child: CupertinoPicker(
            itemExtent: 32,
            onSelectedItemChanged: (index){
              setState(() {

              });
            },
            children: [
              Center(child: Text("AA"),),
              Center(child: Text("BA"),),
              Center(child: Text("BB"),),
        ]),
      ),
    );
  }
  */
}
