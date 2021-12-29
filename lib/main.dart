import 'package:flutter/material.dart';
import 'Questions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List qList = [
    Questions("1.The human body has four lungs.", false),
    Questions("2.Kelvin is a measure of temperature.", true),
    Questions("3.The Atlantic Ocean is the biggest ocean on Earth.", false),
    Questions("4.Sharks are mammals.", false),
    Questions("5.The human skeleton is made up of less than 100 bones.", false),
    Questions("6.Atomic bombs work by atomic fission.", true),
    Questions("7.Molecules are chemically bonded.", true),
    Questions("8.Spiders have six legs.", false),
    Questions(
        "9.Mount Kilimanjaro is the tallest mountain in the world.", false),
    Questions("10.The study of plants is known as botany.", true),
  ];

  var counter = 0;
  var score = 0;
  var highScore = 0;

  Cheacker(bool choose, BuildContext ctx) {
    if (counter < 9) {
      if (choose == qList[counter].isCorrect) {
        final snackbar = SnackBar(
          content: Text("Correct"),
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.green,
        );
        Scaffold.of(ctx).showSnackBar(snackbar);
        score = score + 5;
      }
    } else
      score = score + 0;
    {
      final snackbar = SnackBar(
        content: Text("False"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      Scaffold.of(ctx).showSnackBar(snackbar);
    }

    setState(() {
      if (counter < 9) {
        counter++;
      }
    });
  }

  reset() {
    setState(() {
      if (score > highScore) {
        highScore = score;
      }
      score = highScore;
      score = 0;
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
        backgroundColor: Color(0xFFF7C229),
        centerTitle: true,
      ),
      backgroundColor: Colors.yellow[200],
      body: Builder(
        builder: (ctx) => Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                width: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/background.png"),
                        fit: BoxFit.fill)),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Score ${score}",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () => reset(),
                      child: Text(
                        "Reset Game",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "High Score ${highScore}",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 90,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Color(0xFFF7C229)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(qList[counter].qText),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => Cheacker(true, ctx),
                    padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                    child: Text(
                      "True",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFFF7C229),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Padding(padding: EdgeInsets.only(left: 30)),
                  RaisedButton(
                    onPressed: () => Cheacker(false, ctx),
                    padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                    child: Text(
                      "False",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFFF7C229),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
