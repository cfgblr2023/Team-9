import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sensing_local_app/screens/fetch_image.dart';


class Splash extends StatefulWidget {
  static String id = 'splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState()
  {
    super.initState();
    _navigatetohome();
  }
_navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FetchImage()));
}
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Align(
            alignment: Alignment.center,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
             children:[
                 Image.asset('assets/appLogo.jpeg',
                   width:200,
                   height: 200,),
          ],
          ),
        ),
      ),
    );

  }
}