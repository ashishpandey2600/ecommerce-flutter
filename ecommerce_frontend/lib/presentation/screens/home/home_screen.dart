import 'package:ecommerce_frontend/presentation/screens/home/category_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/home/profile_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/home/user_feed_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> screens = [UserFeedScreen(), CategoryScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce App"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart_fill))
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items:const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
