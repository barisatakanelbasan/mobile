import 'package:flutter/material.dart';
import 'package:flutter_grade_calculator/constants/app_constants.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int classCount;

  const ShowAverage({required this.average,required this.classCount, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(classCount > 0? "$classCount Classes" : "Add a Course",style: Constants.averageBody,),
        Text(average > 0? "${average.toStringAsFixed(2)}" : "0.0",style: Constants.averageStyle,),
        Text("Average",style: Constants.averageBody,),
      ],
    );
  }
}
