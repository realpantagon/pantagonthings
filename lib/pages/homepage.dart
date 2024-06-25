import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:pantagonthings/pages/favorite_page/favoritepage.dart';
import 'package:pantagonthings/pages/main_page/main_page.dart';
import 'package:pantagonthings/pages/search_page/searchpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          Mainpage(),
          Searchpage(),
          FavoritePage(),
        ],
      ),
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
          initIndex: _selectedIndex,
          onChanged: _onItemTapped,
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
