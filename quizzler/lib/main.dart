import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';
import 'package:quizzler/scoreKeeper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
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
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  ScoreKeeper scoreKeeper = ScoreKeeper();
  QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.currentQuestion.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        buildAnswerButton(color: Colors.green, text: 'True', answer: true),
        buildAnswerButton(color: Colors.red, text: 'False', answer: false),
        SizedBox(
          height: 30,
          child: Row(
            children: scoreKeeper.scores,
          ),
        )
      ],
    );
  }

  Expanded buildAnswerButton({Color color, String text, bool answer}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FlatButton(
          textColor: Colors.white,
          color: color,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            setState(() {
              scoreKeeper.add(quizBrain.checkCurrentAnswer(answer));
              if (quizBrain.isFinished) {
                buildEndAlert(
                        scoreKeeper.numCorrectAnswers, quizBrain.numQuestions)
                    .show();
              } else
                quizBrain.nextQuestion();
            });
          },
        ),
      ),
    );
  }

  Alert buildEndAlert(int numCorrect, int numQuestions) {
    return Alert(
      context: context,
      title: 'Finished!',
      desc: 'You\'ve got $numCorrect out of $numQuestions correct answers.',
      closeFunction: () {},
      buttons: [
        DialogButton(
          child: Text(
            'Start over',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => setState(() {
            quizBrain.reset();
            scoreKeeper.reset();
            Navigator.pop(context);
          }),
        ),
      ],
    );
  }
}
