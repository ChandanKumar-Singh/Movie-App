// a7a1c048477195cf9915217c4ac6b375

import 'package:flutter/material.dart';

import 'homePage.dart';

void main ()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,primaryColor: Colors.green),
      home: const HomePage(),
    );
  }
}
