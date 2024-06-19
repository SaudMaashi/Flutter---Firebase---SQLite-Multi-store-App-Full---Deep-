import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_project/auth/customer_signup_screen.dart';
import 'package:my_project/firebase_options.dart';
import 'package:my_project/main_screens/customer_home_screen.dart';
import 'package:my_project/main_screens/supplier_home_screen.dart';
import 'package:my_project/main_screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/welcome_screen",
      routes: {
        "/welcome_screen": (context) => const WelcomeScreen(),
        "/customer_home_screen": (context) => const CustomerHomeScreen(),
        "/supplier_home_screen": (context) => const SupplierHomeScreen(),
        "/customer_signup_screen": (context) => const CustomerSignUpScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
    );
  }
}
