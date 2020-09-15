import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String question = "";
  String answer = "";

  void buttonPressed(String value) {
    setState(() {
      question += value;
    });
  }

  void onCEPressed(String value) {
    setState(() {
      question = value.substring(0, value.length - 1);
    });
  }

  void onEqualPressed() {
    String inputQuestion = question;
    inputQuestion = inputQuestion.replaceAll('x', '*');
    Parser parser = Parser();
    Expression expression = parser.parse(inputQuestion);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }

  Row buildButton({String text1, String text2, String text3, String text4}) {
    return Row(
      children: <Widget>[
        Container(
          height: 50,
          width: 80,
          child: FlatButton(
            color: operator(text1) ? Colors.greenAccent : Colors.grey[900],
            onPressed: () {
              if (text1 == 'AC') {
                buttonPressed(question = "");
                buttonPressed(answer = "");
              } else
                buttonPressed(text1);
            },
            child: Text(
              '$text1',
              style: TextStyle(
                  fontSize: 20,
                  color: operator(text1) ? Colors.white : Colors.blueGrey),
            ),
            shape: CircleBorder(side: BorderSide(width: 0.0)),
          ),
        ),
        SizedBox(
          height: 80,
          width: 15,
        ),
        Container(
          height: 50,
          width: 80,
          child: FlatButton(
            color: operator(text2) ? Colors.blue[400] : Colors.grey[900],
            onPressed: () {
              if (text2 == "CE") {
                onCEPressed(question);
                buttonPressed(answer = '');
              } else
                buttonPressed(text2);
            },
            child: Text(
              '$text2',
              style: TextStyle(
                  fontSize: 20,
                  color: operator(text1) ? Colors.white : Colors.blueGrey),
            ),
            shape: CircleBorder(side: BorderSide(width: 0.0)),
          ),
        ),
        SizedBox(
          height: 80,
          width: 15,
        ),
        Container(
          height: 50,
          width: 80,
          child: FlatButton(
            color: operator(text3) ? Colors.pink : Colors.grey[900],
            onPressed: () {
              buttonPressed(text3);
            },
            child: Text(
              '$text3',
              style: TextStyle(
                  fontSize: 20,
                  color: operator(text1) ? Colors.white : Colors.blueGrey),
            ),
            shape: CircleBorder(side: BorderSide(width: 0.0)),
          ),
        ),
        SizedBox(
          height: 80,
          width: 15,
        ),
        Container(
          height: 50,
          width: 80,
          child: FlatButton(
            color: Colors.pink,
            onPressed: () {
              if (text4 == "=") {
                setState(() {
                  onEqualPressed();
                });
              } else
                buttonPressed(text4);
            },
            child: Text(
              '$text4',
              style: TextStyle(
                  color: operator(text4) ? Colors.white : Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            shape: CircleBorder(side: BorderSide(width: 0.0)),
          ),
        ),
      ],
    );
  }

  bool operator(String x) {
    if (x == '%' ||
        x == '/' ||
        x == '-' ||
        x == '+' ||
        x == 'x' ||
        x == '=' ||
        x == '-/+' ||
        x == 'AC' ||
        x == 'CE') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    question,
                    style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    answer,
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 1,
                width: 325,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: <Widget>[
                buildButton(text1: 'AC', text2: 'CE', text3: '%', text4: '/'),
                buildButton(text1: '7', text2: '8', text3: '9', text4: 'x'),
                buildButton(text1: '4', text2: '5', text3: '6', text4: '-'),
                buildButton(text1: '1', text2: '2', text3: '3', text4: '+'),
                buildButton(text1: '00', text2: '0', text3: '.', text4: '='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
