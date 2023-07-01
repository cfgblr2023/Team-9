import 'package:flutter/material.dart';
import 'package:sensing_local_app/screens/pickImage.dart';
import 'package:sensing_local_app/widgets/AppButton.dart';

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
                                              return PickImage();
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