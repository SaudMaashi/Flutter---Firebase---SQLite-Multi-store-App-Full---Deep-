import 'package:flutter/material.dart';

class SubCategoryProducts extends StatelessWidget {
  final String mainCategoryName;
  final String subCategoryName;
  const SubCategoryProducts(
      {required this.subCategoryName,
      required this.mainCategoryName,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          subCategoryName,
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(mainCategoryName),
      ),
    );
  }
}
