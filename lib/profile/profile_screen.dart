import 'package:flutter/material.dart';
import 'package:rahhal_app/profile/item/item_profile.dart';
import 'package:rahhal_app/utils/app_colors.dart';
import 'package:rahhal_app/utils/app_styles.dart';
import 'package:rahhal_app/utils/screen_size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Text("Ahmed Mohammed",
                    style: AppStyles.regular20WhiteColor,),
                    SizedBox(height: context.height*0.02,),
                    Text("ahmedmohammed@gmail.com",
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
                              Text("12",
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
                              Text("28",
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
                              Text("15",
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
                      color: AppColors.cyanColor,),),
                    SizedBox(height: context.height*0.02,),
                    ItemProfile(text: 'Favorite',
                      icon: Icon(Icons.favorite_border_outlined,
                          color: AppColors.cyanColor),),
                    SizedBox(height: context.height*0.02,),
                    ItemProfile(text: 'Settings',
                      icon: Icon(Icons.settings,
                          color: AppColors.cyanColor),),


                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
