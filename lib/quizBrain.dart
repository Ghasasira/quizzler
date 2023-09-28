import 'question.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  final List<Question> _questionBank = [
    Question(question: 'The Earth is flat.', answer: false),
    Question(question: 'The sun is a planet.', answer: false),
    Question(question: 'Cows can fly.', answer: false),
    Question(question: 'Water boils at 100 degrees Celsius.', answer: true),
    Question(question: 'Humans have gills.', answer: false),
    Question(
        question: 'Mount Everest is the tallest mountain in the world.',
        answer: true),
    Question(
        question: 'The Nile River is the longest river in the world.',
        answer: true),
    Question(question: 'The capital of Australia is Sydney.', answer: false),
    Question(question: 'The moon is made of cheese.', answer: false),
    Question(question: 'Rabbits lay eggs.', answer: false),
    Question(question: 'Water is composed of two elements.', answer: false),
    Question(question: 'Birds are mammals.', answer: false),
    Question(
        question: 'The Statue of Liberty is located in Los Angeles.',
        answer: false),
    Question(
        question:
            'Gravity is a force that attracts objects towards each other.',
        answer: true),
    Question(question: 'Spiders are insects.', answer: false),
    Question(question: 'Sharks are mammals.', answer: true),
    Question(
        question: 'The Great Wall of China is visible from space.',
        answer: true),
    Question(question: 'The Earth revolves around the moon.', answer: false),
    Question(question: 'Elephants can fly.', answer: false),
    Question(question: 'The human body has 206 bones.', answer: true),
    Question(
        question: 'The Atlantic Ocean is the largest ocean in the world.',
        answer: false),
    Question(question: 'The Amazon River flows through Africa.', answer: false),
    Question(question: 'The Eiffel Tower is located in London.', answer: false),
    Question(
        question: 'The planet Mars is closer to the sun than Earth.',
        answer: true),
    Question(question: 'The Earth has one moon.', answer: true),
    Question(question: 'The color of the sun is yellow.', answer: true),
  ];

  int _qnNo = 0;

  void nxtQn(context) {
    if (_qnNo < _questionBank.length - 1) {
      _qnNo++;
    } else {
      Alert(
        context: context,
        type: AlertType.success,
        title: "REACHED THE END",
        desc: "If you wish to go again you know what to do 😉.",
        buttons: [
          DialogButton(
            onPressed: () {
              debugPrint('woow');
            },
            width: 120,
            child: const Text(
              "Restart",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    }
  }

  String getQn() {
    return _questionBank[_qnNo].question;
  }

  bool getAns() {
    return _questionBank[_qnNo].answer;
  }

  int listLen() {
    return _questionBank.length;
  }
}
