import 'package:flutter/material.dart';
import 'package:quizzler/result.dart';
import 'question.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  List<Question> questionBank = [
    Question(q: 'The Earth is flat.', a: false),
    Question(q: 'The Great Wall of China is visible from space.', a: false),
    Question(q: 'The human body has four lungs.', a: false),
    Question(q: 'Mount Everest is the tallest mountain in the world.', a: true),
    Question(q: 'Water boils at 100 degrees Fahrenheit.', a: false),
    Question(q: 'The capital of Australia is Sydney.', a: false),
    Question(q: 'Penguins can fly.', a: false),
    Question(q: 'The Earth is flat.', a: false),
    Question(q: 'The sun is a planet.', a: false),
    Question(
        q: 'The Great Barrier Reef is the largest coral reef in the world.',
        a: true)
  ];

  int questionNumber = 0;
  int score = 0;

  void nextQuestion() {
    if (questionNumber >= questionBank.length - 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => result(
            score: score,
          ),
        ),
      ).then((shouldReset) => {
            if (shouldReset)
              {
                setState(() {
                  questionNumber = 0;
                  score = 0;
                  scoreKeeper = [];
                })
              }
          });
    } else {
      setState(() {
        questionNumber++;
      });
    }
  }

  bool checkAnswer(bool usersAns) {
    if (usersAns == questionBank[questionNumber].questionAns) {
      score++;
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
      return true;
    }
    scoreKeeper.add(
      Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(true);
                  nextQuestion();
                });
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                  nextQuestion();
                });
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
