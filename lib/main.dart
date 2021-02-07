import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [
        {'text': 'Red', 'score': 1},
        {'text': 'Green', 'score': 3},
        {'text': 'Blue', 'score': 2},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'Tarantulas', 'score': 7},
        {'text': 'Alligator', 'score': 10},
        {'text': 'Hippopotamus', 'score': 5},
        {'text': 'Piranha', 'score': 2},
      ]
    },
    {
      'questionText': 'What\'s your favorite football team ?',
      'answers': [
        {'text': 'Real Madrid', 'score': 0},
        {'text': 'Liverpool', 'score': 1000000},
        {'text': 'Manchester United', 'score': -1000000},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
