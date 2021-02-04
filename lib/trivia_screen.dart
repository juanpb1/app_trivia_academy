import 'package:flutter/material.dart';
import 'package:trivia_academy/question.dart';
import 'package:trivia_academy/score_screen.dart';

class TriviaScreen extends StatefulWidget {
  @override
  _TriviaScreenState createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  int answer = 0;
  int score = 0;
  int index = 0;
  List<Question> questionList = Question.getQuestionList();

  void verifyResponse() {
    if (answer == questionList[index].answer) {
      score += 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff374952),
        centerTitle: true,
        title: Image(
          image: AssetImage('lib/assets/icones.png'),
        ),
      ),
      body: Column(
        children: [
          // Questão 1
          Container(
            margin: EdgeInsets.fromLTRB(32, 64, 32, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PERGUNTA 1',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  questionList[index].questionText,
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
          // Opções da Questão 1
          Expanded(
            child: ListView(
              children: [
                //Opção 1
                Container(
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(1, 3)),
                    ],
                  ),
                  child: RadioListTile(
                    value: 1,
                    groupValue: answer,
                    title: Text(questionList[index].option1),
                    onChanged: (int value) {
                      setState(() {
                        answer = value;
                      });
                    },
                  ),
                ),
                //Opção 2
                Container(
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(1, 3),
                        )
                      ]),
                  child: RadioListTile(
                    value: 2,
                    groupValue: answer,
                    title: Text(questionList[index].option2),
                    onChanged: (int value) {
                      setState(() {
                        answer = value;
                      });
                    },
                  ),
                ),
                //Opção 3
                Container(
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: Offset(1, 3),
                      )
                    ],
                  ),
                  child: RadioListTile(
                    value: 3,
                    groupValue: answer,
                    title: Text(questionList[index].option3),
                    onChanged: (int value) {
                      setState(() {
                        answer = value;
                      });
                    },
                  ),
                ),
                // Opção 4
                Container(
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 3,
                          blurRadius: 2,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: RadioListTile(
                    value: 4,
                    groupValue: answer,
                    title: Text(questionList[index].option4),
                    onChanged: (int value) {
                      setState(() {
                        answer = value;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          //Botão RESPONDER
          Container(
            height: 87,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, -1)),
              ],
            ),
            child: Center(
              child: FlatButton(
                child: Text(
                  'Responder',
                  style: TextStyle(fontSize: 16.0),
                ),
                onPressed: () {
                  verifyResponse();
                  if (index < questionList.length - 1) {
                    setState(() {
                      index += 1;
                      answer = 0;
                    });
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScoreScreen(
                                  result: score,
                                  maximun: questionList.length,
                                )));
                  }
                },
                color: Color(0xffDA0175),
                textColor: Color(0xffF7F7F7),
                padding: EdgeInsets.fromLTRB(60, 11, 60, 11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
