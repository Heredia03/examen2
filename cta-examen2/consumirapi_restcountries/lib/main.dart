import 'package:flutter/material.dart';
import 'pantallas/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rest Countries App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MenuScreen(),
    );
  }
}
