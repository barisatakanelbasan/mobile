import 'package:flutter/material.dart';
import 'package:flutter_grade_calculator/models/course.dart';

class DataHelper{

  static List<Course> allAddedCourses = [];

  static addCourse(Course course){
    allAddedCourses.add(course);
  }

  static calculateAverage(){
    double grades = 0;
    double credits = 0;

    allAddedCourses.forEach((element) {
      grades = grades + (element.credit * element.letter);
      credits += element.credit;
    });

    return grades / credits;
  }


  //***************************************************************************
  // GRADES AND LETTERS

  static List<String> _gradeAsLetter(){
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _gradeToDouble(String letter) {
    switch(letter) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default:
        return 0;
    }
  }

  static List<DropdownMenuItem<double>> dropDownItemCreator(){
    return _gradeAsLetter()
        .map(
            (e) => DropdownMenuItem(
              child: Text(e),
              value: _gradeToDouble(e),
            )
          )
          .toList();
  }

  //***************************************************************************
  // CREDITS

  static List<int> _allCredits(){
    return List.generate(10, (index) => index+1).toList();
  }
  
  static List<DropdownMenuItem<double>> allCredits(){
    return _allCredits()
        .map(
            (e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            )
          ).toList();
  }
}