import 'package:flutter/material.dart';
import 'package:flutter_grade_calculator/constants/app_constants.dart';
import 'package:flutter_grade_calculator/helper/data_helper.dart';

class LetterDropdownWidget extends StatefulWidget {
  final Function onLetterSelected;
  const LetterDropdownWidget({required this.onLetterSelected, Key? key}) : super(key: key);

  @override
  _LetterDropdownWidgetState createState() => _LetterDropdownWidgetState();
}

class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {
  double selectedValue = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.5),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        value: selectedValue,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (value){
          setState(() {
            selectedValue = value!;
            widget.onLetterSelected(selectedValue);
          });
        },
        underline: Container(),
        items: DataHelper.dropDownItemCreator(),
      ),
    );
  }
}
