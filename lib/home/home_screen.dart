
import 'package:flutter/material.dart';
import 'package:rahhal_app/home/tabs/aiChat/ai_chat.dart';
import 'package:rahhal_app/home/tabs/explore/explore_tab.dart';
import 'package:rahhal_app/home/tabs/favourite/favoutite_tab.dart';
import 'package:rahhal_app/home/tabs/home/home_tab.dart';
import 'package:rahhal_app/home/tabs/myTrip/my_trip.dart';






class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabsList = [
    HomeTab(), ExploreTap(), MyTrip(), FavoutiteTab(), AiChat(),
  ];

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_travel_outlined),
                activeIcon: Icon(Icons.card_travel),
                label: "My Trip",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                activeIcon: Icon(Icons.favorite),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined),
                activeIcon: Icon(Icons.chat),
                label: "Chat",
              ),
            ],
          ),
          body: tabsList[selectedIndex],

            );
  }

}






