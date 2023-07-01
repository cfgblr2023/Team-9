import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String value;
  final String text;
  TextInputField({required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0,),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white24,
              ),
              child:Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text( value,
                style: TextStyle(
                  fontSize: 18,
                )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}