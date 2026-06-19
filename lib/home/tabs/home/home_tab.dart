import 'package:flutter/material.dart';

import '../../../camera/camera_screen.dart';
import '../../../custom/custom_text_field.dart';
import '../../../onBoarding_screen/custom_button.dart';
import '../../../profile/profile_screen.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/screen_size.dart';
import '../../item_home.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children:[ Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: SizedBox(
                  height: context.height*.30,
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
                        SizedBox(height: context.height*0.065,),
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
                          suffixIcon: IconButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (_)=>CameraScreen()));
                              },
                              icon: Icon(Icons.camera_alt_rounded,
                                color: AppColors.lightMainColor,
                                size: 25,)),

                        ),
                      ]
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SizedBox(
                width: context.width*0.92,
                height: context.height*0.22,
                child: Image.asset(
                  AppAssets.tripImage,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: context.height*0.02,
                    horizontal: context.width*0.03
                ),
                child: Column(
                  children: [
                    Text("Plan your trip easily!",
                      style: AppStyles.nunito16Black,),
                    SizedBox(height: context.height*0.01,),
                    Text("Create your perfect itinerary\nbased on your budget and\ninterests",
                      style: AppStyles.nunito11Black,),
                    SizedBox(height: context.height*0.02,),
                    CustomButton(
                      fillColor: AppColors.cyanColor2,
                      width: context.width*.45,
                      height: context.height*0.05,
                      onPressed: (){

                      },
                      borderRadius: BorderRadius.circular(44),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Start Planning",
                            style: AppStyles.nunito11White,),
                          IconButton(
                              onPressed: (){

                              },
                              icon: Icon(Icons.arrow_forward_ios_outlined,
                                color: AppColors.whiteColor,))
                        ],
                      ),
                    )

                  ],
                ),
              ),


            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Popular Itineraries",
                style: AppStyles.nunito16navy,),
              TextButton(
                  onPressed: (){

                  },
                  child: Text("see all",
                    style: AppStyles.regular16cyanColor,))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItineraryCard(
                  image: AppAssets.pyramidsImage,
                  title: "Cairo in one Day",
                  places: "4 places",
                  price: "500 EGP",
                  duration: "1_day"),
              ItineraryCard(
                  image: AppAssets.pyramidsImage,
                  title: "Hurghada Weekend",
                  places: "5 places",
                  price: "800 EGP",
                  duration: "2_day"),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Popular Itineraries",
                style: AppStyles.nunito16navy,),
              TextButton(
                  onPressed: (){

                  },
                  child: Text("see all",
                    style: AppStyles.regular16cyanColor,))
            ],
          ),


        ],
      ),
    );
  }
}
