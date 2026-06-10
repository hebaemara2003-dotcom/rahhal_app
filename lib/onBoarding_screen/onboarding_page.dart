
import 'package:flutter/material.dart';
import 'package:rahhal_app/model/on_boarding_model.dart';
import 'package:rahhal_app/onBoarding_screen/custom_button.dart';
import 'package:rahhal_app/utils/app_assets.dart';
import 'package:rahhal_app/utils/app_colors.dart';
import 'package:rahhal_app/utils/app_styles.dart';
import 'package:rahhal_app/utils/screen_size.dart';

class OnboardingPage extends StatelessWidget {
  final OnBoardingModel model;
  late final VoidCallback onNext;

   OnboardingPage({super.key,
     required this.model,
     required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              Positioned.fill(
                  child: Image.asset(model.backgroundImage,
                    fit: BoxFit.cover,)
              ),
              Positioned(
                top: context.height*0.55,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal:context.width*.05 ),
                  child: Column(
                    children: [
                      Image.asset(model.middleImage),
                      SizedBox(height: context.height*0.02,),
                      Text(model.subText,
                        style:AppStyles.nunito20Black,),
                      SizedBox(height: context.height*0.02,),
                      Text(model.text,
                        style: AppStyles.regular16BlackColor,),
                      SizedBox(height: context.height*0.02,),
                      CustomButton(onPressed: onNext,
                           borderRadius: BorderRadius.circular(44),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Next",
                                style: AppStyles.nunito16White,),
                              SizedBox(width: context.width*0.02,),
                              Icon(Icons.arrow_forward_ios_outlined,
                                color: AppColors.whiteColor,
                                size: 15,),

                            ],
                          ) )
                    ],
                  ),
                ),
              )
            ]
        )

    );



  }
}
