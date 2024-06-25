import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45.0),
          topRight: Radius.circular(45.0),
        ),
        child: Container(
          color: const Color.fromARGB(255, 38, 38, 38),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: GNav(
              gap: 8,
              backgroundColor: Color.fromARGB(255, 38, 38, 38),
              color: Colors.white,
              activeColor: Colors.blueAccent,
              tabBackgroundColor: Colors.white,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: "Favorite",
                ),
                GButton(
                  icon: Icons.search,
                  text: "search",
                ),
                GButton(
                  icon: Icons.settings,
                  text: "settings",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
