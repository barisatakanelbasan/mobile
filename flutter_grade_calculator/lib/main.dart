import 'package:flutter/material.dart';
import 'package:flutter_grade_calculator/constants/app_constants.dart';
import 'package:flutter_grade_calculator/widgets/calculate_grade_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dynamic Grade Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Constants.mainColor,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: CalculateGradePage(),
    );
  }
}

