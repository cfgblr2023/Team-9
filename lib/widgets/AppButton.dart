import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButtons extends StatelessWidget {
  bool isLoading;
  final String text;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback action;
  AppButtons({required this.text, required this.textColor, required this.buttonColor, required this.action, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
    onPressed: action,
    minWidth: 300.0, 
    height: 50.0,
    color: buttonColor,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
                   ),
                   child: isLoading == false ? Text( text,
                   style: GoogleFonts.poppins(
                   color: textColor,
                  fontSize: 20,
                  ),
                )
                   : CircularProgressIndicator(),
      );
  }
}