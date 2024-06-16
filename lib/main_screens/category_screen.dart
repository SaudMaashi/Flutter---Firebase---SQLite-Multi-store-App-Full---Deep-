import 'package:flutter/material.dart';
import 'package:my_project/categories/accessories_category.dart';
import 'package:my_project/categories/bags_category.dart';
import 'package:my_project/categories/beauty_category.dart';
import 'package:my_project/categories/electronics_category.dart';
import 'package:my_project/categories/home_and_garden_cateogry.dart';
import 'package:my_project/categories/kids_category.dart';
import 'package:my_project/categories/men_category.dart';
import 'package:my_project/categories/shoes_category.dart';
import 'package:my_project/categories/women_category.dart';
import 'package:my_project/widgets/fake_search.dart';

final List<ItemData> items = [
  ItemData(text: "Men"),
  ItemData(text: "Women"),
  ItemData(text: "Shoes"),
  ItemData(text: "Bags"),
  ItemData(text: "Electronices"),
  ItemData(text: "Accessories"),
  ItemData(text: "Home & Garden"),
  ItemData(text: "Kids"),
  ItemData(text: "Beauty"),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _pageController = PageController();
  @override
  void initState() {
    for (var item in items) {
      item.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(bottom: 0, left: 0, child: sideNavigator(size)),
          Positioned(bottom: 0, right: 0, child: categView(size)),
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.linear);
            },
            child: Container(
              color: items[index].isSelected == true
                  ? Colors.white
                  : Colors.grey.shade300,
              height: 100,
              child: Center(
                child: Text(items[index].text),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget categView(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          for (var item in items) {
            item.isSelected = false;
          }
          setState(() {
            items[value].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const [
          MenCategory(),
          WomenCategory(),
          ShoesCategory(),
          BagsCategory(),
          ElectronicsCategory(),
          AccessoriesCategory(),
          HomeAndGardenCategory(),
          KidsCategory(),
          BeautyCategory(),
        ],
      ),
    );
  }
}

class ItemData {
  String text;
  bool isSelected;
  ItemData({
    required this.text,
    this.isSelected = false,
  });
}
