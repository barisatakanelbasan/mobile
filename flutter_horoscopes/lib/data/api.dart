import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_horoscopes/models/horoscope.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": 'sameer-kumar-aztro-v1.p.rapidapi.com',
    "x-rapidapi-key": '1ff8a78a76mshcd28074c33f4bd8p17946ejsne9a58b30dc57',
  };
  Future<Horoscope> get(String horoscope) async {
    final response = await http.get(
      Uri.parse(
          "https://sameer-kumar-aztro-v1.p.rapidapi.com/?sign=$horoscope&day=today"),
      headers: {
        "content-type": "application/json",
        'x-rapidapi-host': 'sameer-kumar-aztro-v1.p.rapidapi.com',
        'x-rapidapi-key': '1ff8a78a76mshcd28074c33f4bd8p17946ejsne9a58b30dc57',
      },
    );
    debugPrint(response.body.toString());
    final jsonItems = json.decode(response.body);
    return Horoscope.fromJson(jsonItems);
  }
}
