import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final color;
  final String buttontext;
  final textcolor;
  final pressed;
  MyButton({this.color, this.buttontext, this.textcolor, this.pressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlatButton(
          onPressed: pressed,
          color: color,
          child: Center(
            child: Text(
              buttontext,
              style: GoogleFonts.robotoSlab(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: (buttontext=='Del')? 20:24,
                    letterSpacing: .5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
