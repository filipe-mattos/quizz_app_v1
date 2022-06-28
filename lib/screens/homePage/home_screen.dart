import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/consts/constants.dart';
import 'package:quizz_app/screens/question/question_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../controllers/question_controller.dart';

class HomeScreen extends StatelessWidget{
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2),
                  Text(
                    "Vamos Jogar o Quizz, ",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  Text("Entre com o seu nome a baixo"),
                  Spacer(),
                  TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Nome Completo",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12)
                          )
                        )
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => {
                      _controller.getUserName(_textController.text),
                      Get.to(QuestionScreen())
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient, 
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Text(
                        "Começar o jogo",
                        style: Theme.of(context).textTheme.button?.copyWith(
                          color: Colors.black
                          ),
                        ),
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}