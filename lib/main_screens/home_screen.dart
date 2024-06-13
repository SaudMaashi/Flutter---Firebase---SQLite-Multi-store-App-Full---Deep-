import 'package:flutter/material.dart';
import 'package:my_project/main_screens/minor_screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Colors.yellow,
                  width: 1.4,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Text(
                        "What are you looking for?",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(
                    height: 32,
                    width: 75,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Center(
                      child: Text(
                        "Search",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow,
            indicatorWeight: 8,
            tabs: [
              RepeatedTab(label: "Men"),
              RepeatedTab(label: "Women"),
              RepeatedTab(label: "Shoes"),
              RepeatedTab(label: "Bags"),
              RepeatedTab(label: "Electronics"),
              RepeatedTab(label: "Accessories"),
              RepeatedTab(label: "Home & Garden"),
              RepeatedTab(label: "Kids"),
              RepeatedTab(label: "Beauty"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("Men Screen"),
            ),
            Center(
              child: Text("Women Screen"),
            ),
            Center(
              child: Text("Shoes Screen"),
            ),
            Center(
              child: Text("Bags Screen"),
            ),
            Center(
              child: Text("Electronics Screen"),
            ),
            Center(
              child: Text("Accessories Screen"),
            ),
            Center(
              child: Text("Home & Garden Screen"),
            ),
            Center(
              child: Text("Kids Screen"),
            ),
            Center(
              child: Text("Beauty Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
