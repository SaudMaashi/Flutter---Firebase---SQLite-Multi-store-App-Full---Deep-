import 'package:flutter/material.dart';
import 'package:my_project/widgets/app_bar_widgets.dart';

class SupplierBalance extends StatelessWidget {
  const SupplierBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(
          title: "Supplier Balance",
        ),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
