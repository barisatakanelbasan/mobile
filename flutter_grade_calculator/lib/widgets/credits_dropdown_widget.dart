import 'package:flutter/material.dart';
import 'package:flutter_grade_calculator/constants/app_constants.dart';
import 'package:flutter_grade_calculator/helper/data_helper.dart';

class CreditsDropdownWidget extends StatefulWidget {
  final Function onCreditsSelected;
  const CreditsDropdownWidget({required this.onCreditsSelected, Key? key}) : super(key: key);

  @override
  _CreditsDropdownWidgetState createState() => _CreditsDropdownWidgetState();
}

class _CreditsDropdownWidgetState extends State<CreditsDropdownWidget> {
  double selectedCredits = 1;
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
        value: selectedCredits,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (value){
          setState(() {
            selectedCredits = value!;
            widget.onCreditsSelected(selectedCredits);
          });
        },
        underline: Container(),
        items: DataHelper.allCredits(),
      ),
    );
  }
}
