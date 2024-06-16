import 'package:flutter/material.dart';
import 'package:my_project/utilities/category_list.dart';
import 'package:my_project/widgets/category_widgets.dart';

class HomeAndGardenCategory extends StatelessWidget {
  const HomeAndGardenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategoryHeaderLabel(
                    headerLabel: "Home & Garden",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 15,
                      children: [
                        ...List.generate(
                          homeandgarden.length,
                          (index) {
                            return SubCategoryModel(
                              mainCategoryName: "Home & Garden",
                              subCategoryName: homeandgarden[index],
                              assetName: "images/homegarden/home$index.jpg",
                              subCategoryLabel: homeandgarden[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: SliderBar(
              mainCategoryName: "Home & Garden",
            ),
          ),
        ],
      ),
    );
  }
}
