import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project/widgets/yellow_button.dart';

const textColors = [
  Colors.yellowAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.green,
  Colors.purple,
  Colors.teal,
];

const textStyle =
    TextStyle(fontSize: 45, fontWeight: FontWeight.bold, fontFamily: "acme");

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool processing = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "images/inapp/bgimage.jpg",
                ),
              ),
            ),
            constraints: const BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      "WELCOME",
                      textStyle: textStyle,
                      colors: textColors,
                    ),
                    ColorizeAnimatedText(
                      "DUCK STORE",
                      textStyle: textStyle,
                      colors: textColors,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                ),
                const SizedBox(
                  height: 120,
                  width: 200,
                  child: Image(
                    image: AssetImage("images/inapp/logo.jpg"),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText(
                        "BUY",
                        textStyle: const TextStyle(
                          color: Colors.lightBlueAccent,
                          fontFamily: "acme",
                          fontSize: 30,
                        ),
                      ),
                      RotateAnimatedText(
                        "SHOP",
                        textStyle: const TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 30,
                          fontFamily: "acme",
                        ),
                      ),
                      RotateAnimatedText(
                        "STORE",
                        textStyle: const TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 30,
                          fontFamily: "acme",
                        ),
                      ),
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Suppliers Only",
                          style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedLogo(controller: _controller),
                            YellowButton(
                              label: "Log In",
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, "/supplier_home_screen");
                              },
                              width: 0.25,
                            ),
                            YellowButton(
                              label: "Sign Up",
                              onPressed: () {},
                              width: 0.25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        YellowButton(
                          label: "Log In",
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, "/customer_home_screen");
                          },
                          width: 0.25,
                        ),
                        YellowButton(
                          label: "Sign Up",
                          onPressed: () {
                            Navigator.pushNamed(
                                context, "/customer_signup_screen");
                          },
                          width: 0.25,
                        ),
                        AnimatedLogo(controller: _controller),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleFacebookLoginIn(
                        label: "Google",
                        onPressed: () {},
                        child: const Image(
                          image: AssetImage("images/inapp/google.jpg"),
                        ),
                      ),
                      GoogleFacebookLoginIn(
                        label: "Facebook",
                        onPressed: () {},
                        child: const Image(
                          image: AssetImage("images/inapp/facebook.jpg"),
                        ),
                      ),
                      processing == true
                          ? const CircularProgressIndicator()
                          : GoogleFacebookLoginIn(
                              label: "Guest",
                              onPressed: () async {
                                await FirebaseAuth.instance.signInAnonymously();
                                // ignore: use_build_context_synchronously
                                Navigator.pushNamed(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    "/customer_home_screen");
                                setState(() {
                                  processing = true;
                                });
                              },
                              child: const Icon(
                                Icons.person,
                                size: 55,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      animation: _controller.view,
      child: const Image(
        image: AssetImage("images/inapp/logo.jpg"),
      ),
    );
  }
}

class GoogleFacebookLoginIn extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Widget child;
  const GoogleFacebookLoginIn({
    super.key,
    required this.label,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: child,
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
