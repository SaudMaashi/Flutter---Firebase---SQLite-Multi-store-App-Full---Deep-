import 'package:flutter/material.dart';
import 'package:my_project/utilities/category_list.dart';
import 'package:my_project/widgets/category_widgets.dart';

class KidsCategory extends StatelessWidget {
  const KidsCategory({super.key});

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
                    headerLabel: "Kids",
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
                              mainCategoryName: "kids",
                              subCategoryName: kids[index],
                              assetName: "images/kids/kids$index.jpg",
                              subCategoryLabel: kids[index],
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
              mainCategoryName: "Kids",
            ),
          ),
        ],
      ),
    );
  }
}
