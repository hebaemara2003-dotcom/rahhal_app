import 'package:flutter/material.dart';

class BottomNavigationBar extends StatelessWidget {
  int ?currentIndex;
  List<BottomNavigationBarItem>? items;
   BottomNavigationBar({super.key, required int currentIndex,
     required List<BottomNavigationBarItem> items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.luggage),
            label: "My Trip",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy_outlined),
            label: "AI Chat",
          ),
        ],
      ),
    );
  }
}
