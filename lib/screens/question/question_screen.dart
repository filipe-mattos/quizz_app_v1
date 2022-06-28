import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'components/body.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ElevatedButton(
            onPressed: _controller.nextQuestion, 
            child: Text("Pular"),
            style: ElevatedButton.styleFrom(
              primary: Colors.indigo,
            ),
          )
        ],
        ),
      body: Body(),
    );
  }
}