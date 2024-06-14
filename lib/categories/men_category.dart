import 'package:flutter/material.dart';
import 'package:my_project/utilities/category_list.dart';

class MenCategory extends StatelessWidget {
  const MenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24.0, bottom: 24),
          child: Text(
            "Men",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.68,
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 70,
            crossAxisSpacing: 15,
            children: [
              ...List.generate(
                men.length,
                (index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: Image(
                          image: AssetImage("images/men/men$index.jpg"),
                        ),
                      ),
                      Text(men[index]),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
