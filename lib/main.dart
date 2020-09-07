import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  Row buildButton({String text1, String text2, String text3, String text4}) {
    return Row(
      children: <Widget>[
        FlatButton(
          color: operator(text1) ? Colors.greenAccent : Colors.grey[900],
          onPressed: () {},
          child: Text(
            '$text1',
            style: TextStyle(
                fontSize: 20,
                color: operator(text1) ? Colors.white : Colors.blueGrey),
          ),
          shape: CircleBorder(side: BorderSide(width: 0.0)),
        ),
        SizedBox(
          height: 80,
          width: 5,
        ),
        FlatButton(
          color: operator(text2) ? Colors.blue[400] : Colors.grey[900],
          onPressed: () {},
          child: Text(
            '$text2',
            style: TextStyle(
                fontSize: 20,
                color: operator(text1) ? Colors.white : Colors.blueGrey),
          ),
          shape: CircleBorder(side: BorderSide(width: 0.0)),
        ),
        SizedBox(
          height: 80,
          width: 5,
        ),
        FlatButton(
          color: operator(text3) ? Colors.pink : Colors.grey[900],
          onPressed: () {},
          child: Text(
            '$text3',
            style: TextStyle(
                fontSize: 20,
                color: operator(text1) ? Colors.white : Colors.blueGrey),
          ),
          shape: CircleBorder(side: BorderSide(width: 0.0)),
        ),
        SizedBox(
          height: 80,
          width: 5,
        ),
        FlatButton(
          color: Colors.pink,
          onPressed: () {},
          child: Text(
            '$text4',
            style: TextStyle(color: operator(text4)? Colors.white : Colors.blueGrey, fontWeight: FontWeight.bold,fontSize: 20.0),
          ),
          shape: CircleBorder(side: BorderSide(width: 0.0)),
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
              height: 300,
            ),
            buildButton(text1: 'AC', text2: 'CE', text3: '%', text4: '/'),
            buildButton(text1: '7', text2: '8', text3: '9', text4: 'x'),
            buildButton(text1: '4', text2: '5', text3: '6', text4: '-'),
            buildButton(text1: '1', text2: '2', text3: '3', text4: '+'),
            buildButton(text1: '00', text2: '0', text3: '.', text4: '='),
          ],
        ),
      ),
    );
  }
}
