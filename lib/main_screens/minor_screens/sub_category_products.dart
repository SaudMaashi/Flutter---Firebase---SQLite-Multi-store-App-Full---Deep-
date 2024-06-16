import 'package:flutter/material.dart';
import 'package:my_project/widgets/app_bar_widgets.dart';

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
        title: AppBarTitle(title: subCategoryName),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const AppBarBackButton(),
      ),
      body: Center(
        child: Text(mainCategoryName),
      ),
    );
  }
}
