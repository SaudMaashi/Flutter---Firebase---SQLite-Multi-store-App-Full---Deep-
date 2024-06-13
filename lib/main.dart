import 'package:flutter/material.dart';
import 'package:my_project/main_screens/customer_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CustomerHomeScreen(),
      theme: ThemeData(useMaterial3: false),
    );
  }
}
