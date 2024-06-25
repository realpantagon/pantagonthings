import 'package:flutter/material.dart';

class Favoritepage extends StatefulWidget {
  const Favoritepage({Key? key}) : super(key: key);

  @override
  _FavoritepageState createState() => _FavoritepageState();
}

class _FavoritepageState extends State<Favoritepage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Text("favoritepage"),
      ),
    );
  }
}
