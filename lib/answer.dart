import 'package:flutter/material.dart';

class AnswerScreen extends StatefulWidget {
  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  int currentQuestionIndex = 0;
  List<String> questions = [
    '今日一番面白かったことはなんですか？',
    '今日一番美味しかった料理はなんですか？',
  ];
  List<List<dynamic>> answers = List.generate(2, (index) => [[], ""]);
  String currentAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('質問回答画面'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[currentQuestionIndex]),
            SizedBox(height: 20),
            TextField(
              onChanged: (text) {
                currentAnswer = text;
              },
              controller: TextEditingController(
                  text: currentQuestionIndex == 0 ? currentAnswer : ''),
            ),
            SizedBox(height: 20),
            if (currentQuestionIndex < questions.length - 1)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    answers[currentQuestionIndex][0].add(currentAnswer);
                    answers[currentQuestionIndex][1] = DateTime.now().toString();
                    currentAnswer = '';
                    currentQuestionIndex++;
                  });
                },
                child: Text('次へ'),
              ),
            if (currentQuestionIndex == questions.length - 1)
              ElevatedButton(
                onPressed: () {
                  answers[currentQuestionIndex][0].add(currentAnswer);
                  answers[currentQuestionIndex][1] = DateTime.now().toString();
                  Navigator.pop(context, answers); // answersを前の画面に渡す
                  print(answers);
                },
                child: Text('完了'),
              ),
          ],
        ),
      ),
    );
  }
}
