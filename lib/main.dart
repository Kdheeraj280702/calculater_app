import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';

var userinput = '';
var answer = '';
bool _isNumeric(String str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}
void eval() {
  Parser p = Parser();
  Expression exp = p.parse(userinput);
  ContextModel cm = ContextModel();
  double result = exp.evaluate(EvaluationType.REAL, cm);
  answer = result.toString();
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final matter = [
    'AC',
    '+/-',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    'Del',
    '0',
    '.',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(208, 205, 215,100),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userinput,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: GoogleFonts.robotoSlab(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              letterSpacing: .5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: matter.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MyButton(
                      color: _isNumeric(matter[index])
                          ? Color.fromRGBO(		11, 57, 72,100)
                          : Color.fromRGBO(	136, 160, 158,100),
                      textcolor: _isNumeric(matter[index])
                          ? Color.fromRGBO(136, 160, 158,100)
                          : Color.fromRGBO(11, 57, 72,100),
                      buttontext: matter[index],
                      pressed: () {
                        setState(() {
                           if (_isNumeric(matter[index])) {
                            userinput += matter[index];
                          } else if (matter[index] == 'Del') {
                            if (userinput.length == 1 ||
                                _isNumeric(userinput[userinput.length - 2]))
                              userinput =
                                  userinput.substring(0, userinput.length - 1);
                            else
                              userinput =
                                  userinput.substring(0, userinput.length - 2);
                          } else if (matter[index] == '*' ||
                              matter[index] == '+' ||
                              matter[index] == '-' ||
                              matter[index] == '/' ||
                              matter[index] == '.' ||
                              matter[index] == '%') {
                            userinput += " " + matter[index] + " ";
                          } else if (matter[index] == '=') {
                            try {
                              eval();
                              userinput = answer;
                            } catch (e) {
                              answer = "Go learn some math idiot";
                            }
                          } else if (matter[index] == 'AC') {
                            userinput = "";
                            answer = "";
                          }
                        });
                      },
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}

