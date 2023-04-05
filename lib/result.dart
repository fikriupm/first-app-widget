import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

 Result(this.resultScore, this.resetQuiz);

  String get resultText {
    String text;
    if (resultScore <= 4) {
      text = 'Perfectly!';
    } else if (resultScore <= 8) {
      text = 'You are awesome & innocent';
    } 
     else if (resultScore <= 12) {
      text = 'You are really ... strange ???!!!';
    }else {
      text = 'You are so bad :(';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              resultText,
              style: TextStyle(
                color: Colors.redAccent[700],
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            TextButton(
              child: Text('Restart Quiz'),
              onPressed: resetQuiz,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange[700] ?? Colors.grey),               
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(16.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}