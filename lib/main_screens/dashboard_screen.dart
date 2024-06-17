import 'package:flutter/material.dart';
import 'package:my_project/dashboard_components/edit_bussiness.dart';
import 'package:my_project/dashboard_components/manage_products.dart';
import 'package:my_project/dashboard_components/my_store.dart';
import 'package:my_project/dashboard_components/supplier_balance.dart';
import 'package:my_project/dashboard_components/supplier_orders.dart';
import 'package:my_project/dashboard_components/supplier_statistics.dart';
import 'package:my_project/widgets/app_bar_widgets.dart';

List<String> labels = [
  "My Store",
  "Orders",
  "Edit Profile",
  "Manage Products",
  "Balance",
  "Statistics",
];

List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart,
];

List<Widget> screens = [
  const MyStore(),
  const SupplierOrders(),
  const EditBussiness(),
  const ManageProducts(),
  const SupplierBalance(),
  const SupplierStatistics(),
];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const AppBarTitle(
            title: "Dashboard",
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/welcome_screen");
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 50,
            crossAxisSpacing: 50,
            children: List.generate(
              6,
              (index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => screens[index],
                      ),
                    );
                  },
                  child: Card(
                    elevation: 20,
                    shadowColor: Colors.purpleAccent.shade200,
                    color: Colors.blueGrey.withOpacity(0.7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          size: 50,
                          icons[index],
                          color: Colors.yellowAccent,
                        ),
                        Text(
                          labels[index].toUpperCase(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: "acme",
                            color: Colors.yellowAccent,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
