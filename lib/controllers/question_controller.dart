import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quizz_app/domain/Question.dart';
import 'package:quizz_app/screens/scorePage/score_screen.dart';

class QuestionController extends GetxController with GetTickerProviderStateMixin{
  
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;
  
  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = questionsList.map(
    (question) => Question(
      id: question["id"],
      answer: question['answer'],
      options: question['options'],
      question: question['question']
      ),
    ).toList();
  
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAnswer;
  int get correctAnswer => this._correctAnswer;

  late int _selectedAnswer = 0;
  int get selectedAnswer => this._selectedAnswer;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _numOfCorrectAnswers = 0;
  int get numOfCorrectAnswers => this._numOfCorrectAnswers;

  late String _userName;
  String get userName => this._userName;
  @override
  void onInit() {
    _animationController = AnimationController(duration: Duration(seconds: 20), vsync: this);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)..addListener(() {
      update();
    });

    _animationController.forward().whenComplete((nextQuestion));

    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();


  }

  void checkAnswer(Question question, int selectedIndex){
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;

    if(_correctAnswer == _selectedAnswer) _numOfCorrectAnswers++;
    
    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 1), () {
     nextQuestion();
    });
  }

  void nextQuestion(){
    if(_questionNumber.value != _questions.length){
      _isAnswered = false;
      _pageController.nextPage(duration: Duration(microseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete((nextQuestion));
      
    }else{
      Get.to(ScoreScreen());
    }
  }

  void updateTheQuestionNumber(int index){
    _questionNumber.value = index + 1;
  }

  void getUserName(String name){
    _userName = name;
  }
  
  void resetFields(){
    this._isAnswered = false;
    this._numOfCorrectAnswers = 0;
    this._selectedAnswer = 0;
    this._userName = '';
    this._questionNumber = 1.obs;
    _pageController = PageController();
    _animationController.reset();
    _animationController.forward().whenComplete((nextQuestion));
  }

  void homeScreenReset(){
    _animationController.stop();
  }

}