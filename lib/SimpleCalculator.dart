import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  late double firstNum;
  late double secondNum;
  late String history = '';
  late String textToDisplay = '';
  late String res;
  late String operation;
  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-' + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      firstNum = double.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNum = double.parse(textToDisplay);
      if (operation == '+') {
        res = (double.parse((firstNum + secondNum).toStringAsFixed(10)))
            .toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (double.parse((firstNum - secondNum).toStringAsFixed(10)))
            .toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'x') {
        res = (double.parse((firstNum * secondNum).toStringAsFixed(10)))
            .toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (double.parse((firstNum / secondNum).toStringAsFixed(10)))
            .toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                color: Color(0xFF28527a),
                width: 6,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
        onPressed: () => btnOnClick(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF546E7A),
        centerTitle: true,
        title: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Container(
            child: Text(
              'Calculator',
              style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF28527a),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 5),
              alignment: Alignment.topCenter,
              child: Text('Shreeya Chatterji - 102103447',
                  style: GoogleFonts.mulish(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ))),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 150, 10, 0),
            child: Text(history,
                style: TextStyle(
                  fontSize: 38.0,
                  // child: Text(equation,style: TextStyle(fontSize: equationFontSize,
                  color: Colors.white,
                )),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(textToDisplay,
                style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.white,
                )),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Table(
                      children: [
                        TableRow(children: [
                          buildButton("AC", 1, Color(0xFFBF360C)),
                          buildButton("C", 1, Color(0xFF7E57C2)),
                          buildButton("<", 1, Color(0xFF7E57C2)),
                        ]),
                        TableRow(children: [
                          buildButton("7", 1, Color(0xFF00ACC1)),
                          buildButton("8", 1, Color(0xFF00ACC1)),
                          buildButton("9", 1, Color(0xFF00ACC1)),
                        ]),
                        TableRow(children: [
                          buildButton("4", 1, Color(0xFF00ACC1)),
                          buildButton("5", 1, Color(0xFF00ACC1)),
                          buildButton("6", 1, Color(0xFF00ACC1)),
                        ]),
                        TableRow(children: [
                          buildButton("1", 1, Color(0xFF00ACC1)),
                          buildButton("2", 1, Color(0xFF00ACC1)),
                          buildButton("3", 1, Color(0xFF00ACC1)),
                        ]),
                        TableRow(children: [
                          buildButton("+/-", 1, Color(0xFF00ACC1)),
                          buildButton("0", 1, Color(0xFF00ACC1)),
                          buildButton("00", 1, Color(0xFF00ACC1)),
                        ])
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Table(
                      children: [
                        TableRow(children: [
                          buildButton("x", 1, Color(0xFF7E57C2)),
                        ]),
                        TableRow(children: [
                          buildButton("-", 1, Color(0xFF7E57C2)),
                        ]),
                        TableRow(children: [
                          buildButton("+", 1, Color(0xFF7E57C2)),
                        ]),
                        TableRow(children: [
                          buildButton("/", 1, Color(0xFF7E57C2)),
                        ]),
                        TableRow(children: [
                          buildButton("=", 1, Colors.redAccent),
                        ])
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
