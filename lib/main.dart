import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sensing_local_app/screens/fetch_image.dart';
import 'package:sensing_local_app/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'splash',
      routes: {
        'fetchImage' : (context) =>FetchImage(),
        'splash': (context) =>Splash(),
      },
    );
  }
}

