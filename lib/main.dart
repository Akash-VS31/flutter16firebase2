import 'package:flutter/material.dart';
import 'package:flutter16firebase2/realtime_database/registrationwrite.dart';

void main() async{

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationWrite(),
    );
  }
}
