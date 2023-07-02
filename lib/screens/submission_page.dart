import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({super.key});

  @override
  State<SubmissionPage> createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Padding(
         padding: const EdgeInsets.symmetric(vertical:10, horizontal: 10),
                  child: Text(
                        'Successfully Submitted!',
                         style: GoogleFonts.poppins(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                  ),
                ),
                Row(
                    children: [
                    IconButton(onPressed:(){Navigator.pushNamed(context, 'fetchImage');}, icon: Icon(Icons.arrow_back)),
                    SizedBox(width: 5),
                    Text('Go back',
                    ),
                    ]
                  )
      ],
      ),
    );
  }
}