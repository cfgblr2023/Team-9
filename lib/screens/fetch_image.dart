import 'package:flutter/material.dart';
import 'package:sensing_local_app/screens/pickImage.dart';
import 'package:sensing_local_app/screens/pickVideo.dart';
import 'package:sensing_local_app/widgets/AppButton.dart';
import 'package:google_fonts/google_fonts.dart';

class FetchImage extends StatefulWidget {
  const FetchImage({super.key});

  @override
  State<FetchImage> createState() => _FetchImageState();
}

class _FetchImageState extends State<FetchImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:200),
        child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                  child: Text(
                        'Sensing Local',
                         style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                  ),
                ),
                AppButtons(text: "Pick an Image", textColor: Colors.white, buttonColor: Color(0xFF5271ff), action: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) {
                    return PickImage();
                    },
                    ),
                  );
                }),
                SizedBox(
                  height: 15,
                ),
                AppButtons(text: "Pick an video", textColor: Colors.white, buttonColor: Color(0xFF5271ff), action: (){
                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                            builder: (context) {
                                              return PickVideo();
                                            },
                                          ),
                                        );
                }),
                
              ],
            ),
          ),
      ),
    );
  }
}