import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/screens/homePage/home_screen.dart';
import 'package:quizz_app/screens/question/question_screen.dart';
import 'package:quizz_app/screens/scorePage/score_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen()
      //QuestionScreen(), 
      //HomeScreen(),
    );
  }
  
}
