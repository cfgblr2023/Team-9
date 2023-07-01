import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:sensing_local_app/screens/form_page.dart';

Position? currentPosition;
String latitude = '';
String longitude = '';

class PickVideo extends StatefulWidget {
  @override
  State<PickVideo> createState() => _PickVideoState();
}
bool isLoading = false;
bool filePicked = false;
late File imageFile;
class _PickVideoState extends State<PickVideo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filePicked = false;
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
          backgroundColor: Colors.white,
        ),
        body: Center(
              child: filePicked?
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/3,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: FileImage(imageFile),
                    ),
                    ),
                  ),
                  IconButton(onPressed: () async{
                  if(await getPermission() == true)
                  {
                    setState(() {
                      isLoading = true;
                    });

                    
                     await getCurrentPosition();

                     setState(() {
                       isLoading= false;
                     });
                  }
                  Navigator.push(
                    context,
                   MaterialPageRoute(builder: (context) => FormPage(category: 'Garbage', imageFile: imageFile, latitude: latitude, longitude: longitude)),
                   );
                  }, icon: Icon(Icons.check_circle, size: 50, color: Colors.green,)),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Classify the video and provide current location'),
                ),
                isLoading?
                Center(
                  child: CircularProgressIndicator(),
                )
                : Container(),
                ],
              )
              :Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () async{
                    final ImagePicker _picker = ImagePicker();
                    //final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                    imageFile = File(image!.path);
                    
                    setState(() {
                      filePicked = true;
                    });

                  print(imageFile);
                  }, icon: Icon(Icons.camera_alt_sharp, size: 50, color: Colors.grey,)),
                  SizedBox( height: 10,),
                  const Text("Tap on icon to capture the picture")
                ],
              ),
            ),
      
      ),
    );
  }
}


Future<bool> getPermission() async{
  
  LocationPermission permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {   
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text('Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }
  return true;
}

Future<void> getCurrentPosition() async{
  final hasPermission = await getPermission();
  if(!hasPermission)
  {
   print("false");
   return;
  }
    try{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    } catch(e) {print("Error");}
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    longitude = position.longitude.toString();
    latitude = position.latitude.toString();
    }