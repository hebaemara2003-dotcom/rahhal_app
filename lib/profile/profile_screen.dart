import 'package:flutter/material.dart';
import 'package:rahhal_app/favorite/favorite_screen.dart';
import 'package:rahhal_app/my_trips/my_trips_screen.dart';
import 'package:rahhal_app/profile/item/item_profile.dart';
import 'package:rahhal_app/settings/settings_screen.dart';
import 'package:rahhal_app/utils/app_assets.dart';
import 'package:rahhal_app/utils/app_colors.dart';
import 'package:rahhal_app/utils/app_styles.dart';
import 'package:rahhal_app/utils/screen_size.dart';

import '../api/profile_api.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   Map<String, dynamic>? profile;
  @override
  void initState() {
    super.initState();
    loadProfile();
  }
  Future<void> loadProfile() async {
    profile = await getProfile();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    if (profile == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor:AppColors.whiteColor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: context.height*0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(57),
                bottomRight: Radius.circular(57)
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF01428C),
                    Color(0xFF005DC2)
                  ])
            ),
          ),
          SafeArea(
            child: Center(
              child: Container(
                margin:EdgeInsets.symmetric(
                  horizontal: context.width*0.09,
                ) ,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Profile",
                      style: AppStyles.regular24WhiteColor,),
                      SizedBox(height: context.height*0.03,),
                      SizedBox(
                        height: context.height*0.08,
                        width: context.width*0.16,
                        child: FloatingActionButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (_)=>ProfileScreen()));
                          },
                          child: Icon(Icons.person,size: 60,
                            color: AppColors.cyanColor,),),
                      ),
                      SizedBox(height: context.height*0.03,),
                    Text(
                      profile!["userName"] ?? "",
                      style: AppStyles.regular20WhiteColor,
                    ),
                      SizedBox(height: context.height*0.02,),
                  Text(profile!["email"] ?? "",
                        style: AppStyles.regular20WhiteColor,),
                      SizedBox(height: context.height*0.04,),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: context.height*0.02,
                            horizontal: context.width*0.1
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.15),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(0, 4))
                            ]
                  ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                        Text(
                        "${profile!["completedTripsCount"] ?? 0}",
                                style: AppStyles.regular16cyanColor,),
                                Text("Trips",
                                  style: AppStyles.regular16DarkGrayColor,),
                                Text("completed",
                                  style: AppStyles.regular16DarkGrayColor,),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Text(
                            "${profile!["visitedPlacesCount"] ?? 0}",
                                  style: AppStyles.regular16cyanColor,),
                                Text("Placed",
                                  style: AppStyles.regular16DarkGrayColor,),
                                Text("Visited",
                                  style: AppStyles.regular16DarkGrayColor,),

                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Text(
                            "${profile!["savedPlacesCount"] ?? 0}",
                                  style: AppStyles.regular16cyanColor,),
                                Text("Saved",
                                  style: AppStyles.regular16DarkGrayColor,),
                                Text("Places",
                                  style: AppStyles.regular16DarkGrayColor,),

                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: context.height*0.045,
                      ),
                      ItemProfile(text: 'My Trips',
                        icon: Icon(Icons.location_on_sharp,
                        color: AppColors.cyanColor,),
                        onTap: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                  builder: (_)=> MyTripsScreen()));
                        },
                      ),
                      SizedBox(height: context.height*0.02,),
                      ItemProfile(text: 'Favorite',
                        icon: Icon(Icons.favorite_border_outlined,
                            color: AppColors.cyanColor),
                        onTap: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                  builder: (_)=> FavoriteScreen()));
                        },),
                      SizedBox(height: context.height*0.02,),
                      ItemProfile(text: 'Settings',
                        icon: Icon(Icons.settings,
                            color: AppColors.cyanColor),
                        onTap: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                  builder: (_)=> SettingsApp()));
                        }),

                      SizedBox(height: context.height*0.02,),
                      Text(
                        "Recent Trips",
                        style: AppStyles.regular16BlackColor,
                      ),

                      SizedBox(height: context.height * 0.02),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: profile!["recentTrips"].length,
                        itemBuilder: (context, index) {

                          var trip = profile!["recentTrips"][index];

                          return Container(
                            margin: EdgeInsets.only(bottom: context.height * 0.02),
                            padding: EdgeInsets.symmetric(
                              vertical: context.height * 0.01,
                              horizontal: context.width * 0.03,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            child: Row(
                              children: [

                                Image.network(
                                  "https://implant-liberty-transfer.ngrok-free.dev${trip["mainImageUrl"]}",
                                  height: context.height * 0.12,
                                  width: context.width * 0.25,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      AppAssets.aboEllHoolImage,
                                      height: context.height * 0.12,
                                      width: context.width * 0.25,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),

                                SizedBox(width: context.width * 0.05),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      trip["tripName"],
                                      style: AppStyles.regular16navyBlueColor,
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      trip["startDate"].substring(0, 10),
                                      style: AppStyles.regular16DarkGrayColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      // Container(
                      //   padding: EdgeInsets.symmetric(
                      //       vertical: context.height*0.01,
                      //       horizontal: context.width*0.03
                      //   ),
                      //   decoration: BoxDecoration(
                      //       color: AppColors.whiteColor,
                      //       borderRadius: BorderRadius.circular(8),
                      //       boxShadow: [
                      //         BoxShadow(color: Colors.black.withOpacity(0.15),
                      //             blurRadius: 10,
                      //             spreadRadius: 2,
                      //             offset: Offset(0, 4))
                      //       ]
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       Image.asset(AppAssets.aboEllHoolImage,
                      //       height: context.height*0.16,
                      //       width: context.width*0.3,),
                      //       Column(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text("The Great Sphinx",
                      //             style: AppStyles.regular16navyBlueColor,),
                      //           Text("Nov 15, 2025",
                      //             style: AppStyles.regular16DarkGrayColor,),
                      //         ],
                      //       ),
                      //
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: context.height*0.02,),
                      // Container(
                      //   padding: EdgeInsets.symmetric(
                      //       vertical: context.height*0.01,
                      //       horizontal: context.width*0.03
                      //   ),
                      //   decoration: BoxDecoration(
                      //       color: AppColors.whiteColor,
                      //       borderRadius: BorderRadius.circular(8),
                      //       boxShadow: [
                      //         BoxShadow(color: Colors.black.withOpacity(0.15),
                      //             blurRadius: 10,
                      //             spreadRadius: 2,
                      //             offset: Offset(0, 4))
                      //       ]
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       Image.asset(AppAssets.aboEllHoolImage,
                      //         height: context.height*0.2,
                      //         width: context.width*0.3,),
                      //       Column(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text("The Great Sphinx",
                      //             style: AppStyles.regular16navyBlueColor,),
                      //           Text("Nov 15, 2025",
                      //             style: AppStyles.regular16DarkGrayColor,),
                      //         ],
                      //       ),
                      //
                      //     ],
                      //   ),
                      // ),


                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
