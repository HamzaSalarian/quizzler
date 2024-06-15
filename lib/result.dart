import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class result extends StatelessWidget {
  final int score;
  const result({required this.score, super.key});

  String displayScore() {
    if (score >= 5) {
      return 'Congratulations!';
    }
    return 'Try Again';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      displayScore(),
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      'Your score is $score',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('Restart Quiz'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
