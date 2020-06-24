import 'package:flutter/material.dart';
import 'buttons.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final matter = [
    'AC','+/-','%','/',
    '7','8','9','x',
    '4','5','6','-',
    '1','2','3','+',
    'clear','0','.','='
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(

          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4) ,
                physics:NeverScrollableScrollPhysics(),
                  itemCount: matter.length,
                  itemBuilder: (BuildContext context, int index){
                  return MyButton(
                    color:_isNumeric(matter[index])? Colors.deepPurple[500]: Colors.grey[500],
                    textcolor: _isNumeric(matter[index])? Colors.grey[500]:Colors.deepPurple[500],
                    buttontext: matter[index],
                  );
                  },

                  )
            ),
          ],
        ),
      ),
    );
  }
}

bool _isNumeric(String str) {
  if(str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}