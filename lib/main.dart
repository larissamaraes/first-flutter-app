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
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': "What\'s your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': "What\'s your favorite animal?",
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 1},
        {'text': 'Elephant', 'score': 4},
        {'text': 'Lion', 'score': 8}
      ]
    },
    {
      'questionText': "Who\'s your favorite instructor?",
      'answers': [
        {'text': 'Larissa', 'score': 2},
        {'text': 'Lari ;D', 'score': 10},
        {'text': 'Larissa M.', 'score': 1},
        {'text': 'Lari :)', 'score': 6}
      ]
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    _totalScore += score;
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
