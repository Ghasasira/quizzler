import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizBrain.dart';

void main() => runApp(const Quizler());

class Quizler extends StatelessWidget {
  const Quizler({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
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
  List<Icon> scoreKeeper = [
    // const Icon(
    //   Icons.check,
    //   color: Colors.green,
    // ),
    // const Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
  ];

  void checkAnswer(bool userChoice) {
    bool correctAnswer = quizBrain.getAns();
    setState(() {
      quizBrain.nxtQn(context);
      if (correctAnswer == userChoice) {
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    });
  }

  // Question q1 = Question(q: 'why are you ge', a: true);

  // List<String> questions = ['why are you ge', "you are ge.", 'yes,you are ge'];
  // List<bool> answers = [true, false, false];

  QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQn(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text("True"),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("False"),
            ),
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          runSpacing: 5.0,
          spacing: 5.0,
          children: scoreKeeper,
        ),
      ],
    );
  }
}
