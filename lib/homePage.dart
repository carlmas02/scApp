import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:hunt/quizPage.dart';
import 'themes.dart' as Theme;

// ignore: camel_case_types
class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  // variables
  String resp;
  final otp = TextEditingController();
  final email = TextEditingController();
  bool isLoading = false;

  //Snackbar
  void showSnackBar(BuildContext context, text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontFamily: GoogleFonts.varela().fontFamily),
      ),
      backgroundColor: Color(0xffbf372b),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(50),
      elevation: 20,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> logUser() async {
    http.Response resp = await http.post(
      Uri.parse('http://vaxraxd.tech/ap/verotp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode([
        {"otp": otp.text, "email": email.text}
      ]),
    );

    if (resp.statusCode == 200) {
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => quizPage(otp: otp.text, email: email.text)));
    } else if (resp.statusCode == 400) {
      otp.clear();
      email.clear();
      Navigator.of(context).pop();
      print('here');
      showSnackBar(context, 'Invalid Code');
    }
    // otp.clear();
  }

  int startGame() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    logUser();
    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>quizPage(otp : otp.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bg_img.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(height: 180, image: AssetImage('assets/IRIS.jpeg')),
                Text('Treasure Hunt', style: TextStyle(color: Color(0xffe0b668))),
                // AnimatedTextKit(
                //   repeatForever: true,
                //   animatedTexts: [
                //
                //     TypewriterAnimatedText('Into the shoes of a sleeper agent...',
                //       textStyle: TextStyle(fontSize:20),
                //       cursor: '|',
                //       speed :Duration(milliseconds: 90)
                //     ),
                //   ],
                // ),
                SizedBox(height: 55),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      controller: otp,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Enter Code",
                        hintStyle: TextStyle(color: Color(0xffbf372b)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      style: TextStyle(color: Colors.black, fontSize: 14.5),
                      controller: email,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Enter Email here",
                        hintStyle: TextStyle(color: Color(0xffbf372b)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrange.withOpacity(0.5),
                          offset: Offset(-6.0, -6.0),
                          blurRadius: 16.0,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(6.0, 6.0),
                          blurRadius: 16.0,
                        ),
                      ],
                      color: Color(0xffbf372b),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ElevatedButton(
                      style: Theme.button1,
                      child: Text("Start"),
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        startGame();
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        offset: Offset(-6.0, -6.0),
                        blurRadius: 16.0,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(6.0, 6.0),
                        blurRadius: 16.0,
                      ),
                    ],
                    color: Color(0xffbf372b),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
