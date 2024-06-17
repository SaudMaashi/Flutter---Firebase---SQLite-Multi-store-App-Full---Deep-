import 'package:flutter/material.dart';
import 'package:my_project/widgets/app_bar_widgets.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(
          title: "Wishlist",
        ),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
