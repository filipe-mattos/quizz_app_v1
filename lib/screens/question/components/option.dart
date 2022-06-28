import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/consts/constants.dart';
import 'package:quizz_app/controllers/question_controller.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key, required this.text, required this.index, required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (controller) {

        Color getTheRightColor(){
          if(controller.isAnswered){
            if(index == controller.correctAnswer){
              return kGreenColor;
            }else if (index == controller.selectedAnswer && controller.selectedAnswer != controller.correctAnswer){
              return kRedColor;
            }
          }
          return kGrayColor;
        }

        IconData getTheRightIcon(){
          return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index + 1}. $text",
                  style: TextStyle(color: getTheRightColor(), fontSize: 16),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == kGrayColor 
                      ? Colors.transparent 
                      : getTheRightColor(),
                    border: Border.all(color: getTheRightColor()),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: getTheRightColor() == kGrayColor ? null :Icon(getTheRightIcon(), size: 16)
                )
              ],
            ),
          ),
        );
      }
    );
  }
}