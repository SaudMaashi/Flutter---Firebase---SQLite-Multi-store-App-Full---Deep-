import 'package:flutter/material.dart';
import 'package:my_project/main_screens/customer_home_screen.dart';
import 'package:my_project/main_screens/supplier_home_screen.dart';
import 'package:my_project/main_screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/customer_home_screen",
      routes: {
        "/welcome_screen": (context) => const WelcomeScreen(),
        "/customer_home_screen": (context) => const CustomerHomeScreen(),
        "/supplier_home_screen": (context) => const SupplierHomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
    );
  }
}
