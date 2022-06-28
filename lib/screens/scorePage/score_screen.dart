import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/consts/constants.dart';
import 'package:quizz_app/controllers/question_controller.dart';
import 'package:quizz_app/screens/homePage/home_screen.dart';

import '../question/question_screen.dart';

class ScoreScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Spacer(flex: 2),
              Text(
                "${_questionController.userName} seu score foi: ",
                style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text("${_questionController.numOfCorrectAnswers * 10}/${_questionController.questions.length * 10}", style: Theme.of(context).textTheme.headline4?.copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
                child: InkWell(
                  onTap: () => {
                    Get.to(QuestionScreen()),
                    _questionController.resetFields()
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
                        "Jogar Novamente",
                        style: Theme.of(context).textTheme.button?.copyWith(
                          color: Colors.black
                          ),
                        ),
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 100, left: kDefaultPadding, right: kDefaultPadding),
                child: InkWell(
                  onTap: () => {
                    _questionController.resetFields(),
                    Get.to(HomeScreen()),
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
                        "Voltar Para Home",
                        style: Theme.of(context).textTheme.button?.copyWith(
                          color: Colors.black
                          ),
                        ),
                    ),
                ),
              ),
            ]
            

          )
        ],
      ),
    );
  }

}