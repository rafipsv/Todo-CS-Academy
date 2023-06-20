// ignore_for_file: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetTodo {
  List<dynamic> todos = [];
  Future<List<dynamic>> getTodo() async {
    String url = "https://api.nstack.in/v1/todos";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      debugPrint(data["items"].toString());
      for (var alldata in data['items']) {
        todos.add(alldata);
      }
      return todos;
    } else {
      return todos;
    }
  }
}
