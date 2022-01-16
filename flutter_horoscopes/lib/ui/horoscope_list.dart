import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_horoscopes/data/api.dart';
import 'package:flutter_horoscopes/models/horoscope.dart';

class HoroscopeList extends StatelessWidget {
  HoroscopeList({Key? key}) : super(key: key);
  List<Horoscope>? horoscopes;
  final api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        api.get("taurus").toString(),
      ),
    );
  }
}
