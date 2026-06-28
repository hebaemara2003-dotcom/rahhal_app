
import 'package:flutter/material.dart';
import 'package:rahhal_app/home/tabs/aiChat/ai_chat.dart';
import 'package:rahhal_app/home/tabs/explore/explore_tab.dart';
import 'package:rahhal_app/home/tabs/favourite/favoutite_tab.dart';
import 'package:rahhal_app/home/tabs/home/home_tab.dart';
import 'package:rahhal_app/home/tabs/myTrip/my_trip.dart';

import '../I10n/app_localizations.dart';
import '../camera/camera_screen.dart';
import '../custom/custom_text_field.dart';
import '../onBoarding_screen/custom_button.dart';
import '../profile/profile_screen.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_routes.dart';
import '../utils/app_styles.dart';
import '../utils/screen_size.dart';
import 'item_home.dart';



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
            label: "Trip",
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
// bottomNavigationBar: BottomNavigationBar(
//   backgroundColor: Colors.black,
//     type: BottomNavigationBarType.fixed,
//     currentIndex: selectedIndex,
//     onTap: (index) {
//       selectedIndex = index;
//       setState(() {
//
//       });
//     },
//     items: [
//       buildBottomNavigationBarItem(
//         index: 0,
//         unSelectedIcon: Icon(Icons.home_outlined),
//         selectedIcon: Icon(Icons.home),
//         lable: "home",
//       ),
//       buildBottomNavigationBarItem(
//           index: 1,
//           unSelectedIcon: Icon(Icons.explore_outlined),
//           selectedIcon: Icon(Icons.explore),
//           lable: "explore"
//       ),
//       // buildBottomNavigationBarItem(
//       //     index: 2,
//       //     unSelectedIcon: Icon(Icons.card_travel_outlined),
//       //     selectedIcon: Icon(Icons.card_travel),
//       //     lable: "My trip"
//       // ),
//       // buildBottomNavigationBarItem(
//       //     index: 3,
//       //     unSelectedIcon: Icon(Icons.favorite_border_outlined),
//       //     selectedIcon: Icon(Icons.favorite),
//       //     lable: "favorite"
//       // ),
//       // buildBottomNavigationBarItem(
//       //     index: 4,
//       //     unSelectedIcon: Icon(Icons.chat_rounded),
//       //     selectedIcon: Icon(Icons.chat_rounded),
//       //     lable: "Ai Chat"
//       // ),
//
//     ]
// ),
//    body: tabsList[selectedIndex],
//  );
// }

//   BottomNavigationBarItem buildBottomNavigationBarItem({
//     required Widget selectedIcon, required Widget unSelectedIcon,
//     required String lable, required int index
//   }) {
//     return BottomNavigationBarItem(icon: selectedIndex == index ?
//     selectedIcon : unSelectedIcon,
//         label: lable);
//   }
// }





