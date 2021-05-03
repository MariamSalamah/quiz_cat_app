


import 'package:flutter/material.dart';

import 'package:quiz_cat_app/questions.dart';


class QuizBrain {

  int _questionNum= 0 ;

  List<Question> _questionsBank = [
    Question(q: "Marrakesh is the capital of Morocco?" , a: false),
    Question(q: "An octopus has three hearts?" , a: true),
    Question(q: "Mount Kilimanjaro is the highest mountain in the world?" , a: false),
    Question(q: "Nepal is the only country in the world which have a non-rectangular flag?" , a: true),
    Question(q: "The Mona Liza was stolen from the Louvre in 1911?" , a: true),
    Question(q: "The Great Wall of China is visible from space?" , a: false),
    Question(q: "David Beckham scored the longest distance Premier League goal?" , a: false),
    Question(q: "Angel Di Maria is the most expensive player bought by a Premier League team?" , a: true),
    Question(q: "The spoon was invented 1000 BC?" , a: true),
    Question(q: "A hair of a polar bear's fur is white?" , a: false),



  ];

  void questionServer(){
    if (_questionNum < _questionsBank.length-1){
      _questionNum++;
      /*if(_questionNum == _questionsBank.length-1){

      }*/
    }
  }

    String getQuetionText (){
      return _questionsBank[_questionNum].questionText;
    }
  bool getQuetionAns (){
    return _questionsBank[_questionNum].questionAns;
  }

  bool isFinished() {
    if (_questionNum >= _questionsBank.length - 1) {

     return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNum = 0;

      }

  double getsum (){
    return _questionsBank.length/2;
  }
}



