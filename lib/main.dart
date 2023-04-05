import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'Whats your favorite sport ?',
      'answers': [
        {'text': 'Frisbee', 'score': 10},
        {'text': 'Basketball', 'score': 5},
        {'text': 'Rugby', 'score': 3},
        {'text': 'Football', 'score': 1}
      ]
    },
    {
      'questionText': 'Whats your favorite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What  is your favorite Movie Genre  ?',
      'answers': [
        {'text': 'Fiction', 'score': 10},
        {'text': 'Comedy', 'score': 5},
        {'text': 'Horror', 'score': 3},
        {'text': 'Action', 'score': 1}
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex += 1;
    });

    _totalScore += score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.redAccent),
        ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter App Widget Lab 3',
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
