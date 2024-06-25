import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: CircleNavBar(
          activeIcons: const [
            Icon(Icons.home, color: Color.fromARGB(255, 255, 255, 255)),
            Icon(Icons.search, color: Color.fromARGB(255, 255, 255, 255)),
            Icon(Icons.favorite, color: Color.fromARGB(255, 255, 255, 255)),
          ],
          inactiveIcons: const [
            Text("Home"),
            Text("Search"),
            Text("Favorite"),
          ],
          color: const Color.fromARGB(255, 0, 0, 0),
          height: 60,
          circleWidth: 60,
          initIndex: 1,
          onChanged: (v) {
            // TODO
          },
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
          shadowColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 10,
        ),
      ),
    );
  }
}
