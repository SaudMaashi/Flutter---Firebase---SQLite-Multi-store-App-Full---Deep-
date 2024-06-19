import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project/customer_screens/customer_orders_screen.dart';
import 'package:my_project/customer_screens/wishlist_screen.dart';
import 'package:my_project/main_screens/cart_screen.dart';
import 'package:my_project/widgets/alert_dialog.dart';
import 'package:my_project/widgets/app_bar_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.white,
                expandedHeight: 140,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constrains) {
                    return FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        opacity: constrains.biggest.height <= 120 ? 1 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: const Text(
                          "Account",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      background: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.yellow, Colors.brown],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25, left: 30),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage("images/inapp/guest.jpg"),
                                radius: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(
                                  "guest".toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                              ),
                              child: Center(
                                child: TextButton(
                                  child: SizedBox(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: const Center(
                                      child: Text(
                                        "Cart",
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const CartScreen(
                                          back: AppBarBackButton(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 100,
                            color: Colors.yellow,
                            child: Center(
                              child: TextButton(
                                child: SizedBox(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: const Center(
                                    child: Text(
                                      "Orders",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CustomerOrders(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              child: Center(
                                child: TextButton(
                                  child: SizedBox(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: const Center(
                                      child: Text(
                                        "Wishlist",
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Wishlist(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                      child: Image(
                        image: AssetImage("images/inapp/logo.jpg"),
                      ),
                    ),
                    const ProfileHeaderLabel(headerLabel: "  Account Info.  "),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 260,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Column(
                          children: [
                            RepeatedListTile(
                              title: "Email Address",
                              subTitle: "example@gmail.com",
                              icon: Icons.email,
                            ),
                            YellowDivider(),
                            RepeatedListTile(
                              title: "Phone No.",
                              subTitle: "+111111",
                              icon: Icons.phone,
                            ),
                            YellowDivider(),
                            RepeatedListTile(
                              title: "Address",
                              icon: Icons.pin,
                              subTitle: "example: 140 - st - New Gresy",
                            )
                          ],
                        ),
                      ),
                    ),
                    const ProfileHeaderLabel(
                        headerLabel: "  Account Settings  "),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 260,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            RepeatedListTile(
                              title: "Edit Profile",
                              icon: Icons.edit,
                              onPressed: () {},
                            ),
                            const YellowDivider(),
                            RepeatedListTile(
                                onPressed: () async {},
                                title: "Change Password",
                                icon: Icons.lock),
                            const YellowDivider(),
                            RepeatedListTile(
                              title: "Log Out",
                              icon: Icons.logout,
                              onPressed: () {
                                MyAlertDialog.showMyDialog(
                                  context: context,
                                  title: "Log Out",
                                  content: "Are you sure to log out?",
                                  tapYes: () async {
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(
                                        context, "/welcome_screen");
                                    await FirebaseAuth.instance.signOut();
                                  },
                                  tapNo: () {
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onPressed;
  const RepeatedListTile({
    super.key,
    required this.title,
    this.subTitle = "",
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const ProfileHeaderLabel({
    super.key,
    required this.headerLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
            headerLabel,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
