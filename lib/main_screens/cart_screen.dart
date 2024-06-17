import 'package:flutter/material.dart';
import 'package:my_project/main_screens/customer_home_screen.dart';
import 'package:my_project/widgets/app_bar_widgets.dart';
import 'package:my_project/widgets/yellow_button.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({
    super.key,
    this.back,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(
          title: "Cart",
        ),
        leading: widget.back,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your Cart Is Empty!",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 50),
            Material(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(25.0),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.6,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CustomerHomeScreen();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Continue Shopping",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text(
                    "Total \$ ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "00.00",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              YellowButton(
                width: 0.4,
                onPressed: () {},
                label: "CHECK OUT",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
