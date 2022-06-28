import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/consts/constants.dart';
import 'package:quizz_app/controllers/question_controller.dart';
import 'package:quizz_app/screens/question/components/option.dart';
import 'package:quizz_app/screens/question/components/progress_bar.dart';
import 'package:quizz_app/screens/question/components/questionCard.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../domain/Question.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(TextSpan(
                  text: "Pegunta ${_questionController.questionNumber.value}",
                  style: Theme.of(context).textTheme.headline4?.copyWith(color: kSecondaryColor),
                  children: [
                    TextSpan(text: "/${_questionController.questions.length}", style: Theme.of(context).textTheme.headline4?.copyWith(color: kSecondaryColor))
                  ],
                ),
                )
                  ),
              ),
              Divider(thickness: 1.5),
              SizedBox(height: kDefaultPadding),
              
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: _questionController.updateTheQuestionNumber,
                  controller: _questionController.pageController,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(question: _questionController.questions[index]),
              )
              ),
            ],
          ),
          
        )
      ],
    );
  }
}