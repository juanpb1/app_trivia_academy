import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  int result;
  int maximun;

  ScoreScreen({Key key, @required this.result, @required this.maximun})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff374952),
        centerTitle: true,
        title: Image(image: AssetImage('lib/assets/icones.png')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 113,
                ),
                Text(
                  'VOCÊ ACERTOU:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '$result',
                      style: TextStyle(
                          color: Color(0xffE83B86),
                          fontSize: 100,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '/ $maximun',
                      style: TextStyle(
                          color: Color(0xff263238),
                          fontSize: 40,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ),
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
                  'Jogar Novamente',
                  style: TextStyle(fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
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
