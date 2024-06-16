import 'package:flutter/material.dart';
import 'package:my_project/utilities/category_list.dart';
import 'package:my_project/widgets/category_widgets.dart';

class AccessoriesCategory extends StatelessWidget {
  const AccessoriesCategory({super.key});

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
                    headerLabel: "Electronics",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 15,
                      children: [
                        ...List.generate(
                          accessories.length,
                          (index) {
                            return SubCategoryModel(
                              mainCategoryName: "accessories",
                              subCategoryName: accessories[index],
                              assetName:
                                  "images/accessories/accessories$index.jpg",
                              subCategoryLabel: accessories[index],
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
              mainCategoryName: "Accessories",
            ),
          ),
        ],
      ),
    );
  }
}
