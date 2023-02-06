import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Future<void> logUser() async {
    http.Response resp = await http.get(
      Uri.parse('http://vaxraxd.tech/ap/'),
    );

    log(resp.body.toString());
  }

  void startGame() {
    logUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              child: Text("hello"),
              onPressed: () {
                startGame();
              })),
    );
  }
}
