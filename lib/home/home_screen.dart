import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rahhal_app/custom/custom_text_field.dart';
import 'package:rahhal_app/profile/profile_screen.dart';
import 'package:rahhal_app/utils/app_assets.dart';
import 'package:rahhal_app/utils/app_colors.dart';
import 'package:rahhal_app/utils/app_styles.dart';
import 'package:rahhal_app/utils/screen_size.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: AlignmentGeometry.topCenter,
        children: [
          Positioned(
            top: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                height: context.height*.27,
                child: Image.asset(AppAssets.homeScreenImage,
                  fit: BoxFit.cover,
                 ),
              )),
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: context.width*0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Hello, Traveler!',
                      style: AppStyles.regular15BlackColor,),
                      Spacer(),
                      FloatingActionButton.small(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (_)=>ProfileScreen()));
                          },
                      child: Icon(Icons.person_2_outlined,size: 25,
                      color: AppColors.cyanColor,),)

                    ],
                  ),
                  Text("Where do you\n want to go?",
                  style: AppStyles.sans24BlackColor,),
                  SizedBox(height: context.height*0.01,),
                  Text("Discover Egypt your way",
                    style: AppStyles.regular13BlackColor,),
                  SizedBox(height: context.height*0.033,),
                  CustomTextFeild(
                    filled: true,
                    fillColor: AppColors.whiteColor,
                    borderColor: AppColors.borderColor,

                    hintText: 'Search for Places.......',
                    hintStyle: AppStyles.regular16LightGrayColor,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: AppColors.mainGrayColor,
                      size: 25,
                    ),
                    suffixIcon: Icon(
                        Icons.camera_alt_rounded,
                      color: AppColors.lightMainColor,
                      size: 25,),
                  ),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
