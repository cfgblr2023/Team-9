import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sensing_local_app/screens/services.dart';
import '../widgets/AppButton.dart';
import '../widgets/TextButtons.dart';
import 'package:path/path.dart';

class FormPage extends StatefulWidget {
  final String longitude;
  final String latitude;
  final File imageFile;
  final String category;
  FormPage({required this.category, required this.imageFile, required this.latitude, required this.longitude});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var imageUrl;
  bool isLoading = false;
  final geometry = [
    "Line",
    "Point"
  ];
  String? selectedVal = 'Point';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/10, horizontal: 30),
        child: Container(
           decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20),),
             color: Color(0xFF5271ff),
          ),
             child: Padding(
                padding: EdgeInsets.symmetric(horizontal:30),
                child: ListView(
                  children: [
                    Text('Verify the Details',
                    style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),),
                        SizedBox(
                        height: 20,
                       ),
                        TextInputField(text: 'Category', value: widget.category),
                        TextInputField(text: 'Longitude', value: widget.longitude),
                        TextInputField(text: 'Latitude', value: widget.latitude),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Geometry Type',
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          )),
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          value: selectedVal,
                          items: geometry.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              selectedVal = val as String;
                            });
                          }),
                //        Container(
                //        height: MediaQuery.of(context).size.height/2,
                //          width: MediaQuery.of(context).size.width/2,
                //         decoration: BoxDecoration(
                //           image: DecorationImage(image: FileImage(widget.imageFile),
                //    ),
                //  ),
                //   ),
                       SizedBox(
                        height: 20,
                       ),
                        AppButtons(text: 'Verify', textColor: Colors.white, buttonColor: Colors.black, action: () async{
                         setState(() {
                           isLoading = true;
                         });

                         //adding data in user's complaint collection
                         String fileName = basename(widget.imageFile.path);
                          uploadImage() async{
                            // Reference reference = FirebaseStorage.instance.ref()
                            // .child('image/');
                            // final UploadTask upLoadTask = reference.putFile(imageFile);
                            // final TaskSnapshot snapshot = (await UploadTask) as TaskSnapshot;
                            // imageUrl =  await snapshot.ref.getDownloadURL();
                          var snapshot = await FirebaseStorage.instance.ref()
                          .child('images/$fileName')
                          .putFile(widget.imageFile);
                           imageUrl = await snapshot.ref.getDownloadURL();
                          }
                         await uploadImage();
                         await FirebaseFirestore.instance.collection("database").doc()
                         .set(
                          {
                            'category': widget.category,
                            'latitude': widget.latitude,
                            'longitude': widget.longitude,
                            'imageFile' : imageUrl,
                            'geometry' : selectedVal,
                          }
                         );
                         //adding data in corresponding category folder
                          await FirebaseFirestore.instance.collection("database").doc()
                         .set(
                          {
                            'category': widget.category,
                            'latitude': widget.latitude,
                            'longitude': widget.longitude,
                            'imageFile' : imageUrl,
                            'geometry' : selectedVal,
                          }
                         );

                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushNamed(context, 'submission');},
                          isLoading: isLoading,)

            ],
        ),
        ),
        ),
      ),
    );
  }
}
