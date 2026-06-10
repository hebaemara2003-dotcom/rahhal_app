import 'package:flutter/material.dart';
import 'package:rahhal_app/home/home_screen.dart';
import 'package:rahhal_app/login/login_screen.dart';
import 'package:rahhal_app/utils/app_assets.dart';

import '../custom/custom_text_field.dart';
import '../onBoarding_screen/custom_button.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import '../utils/screen_size.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(AppAssets.registerScreenImage,
              fit: BoxFit.cover,),
          ),
          Positioned(
          top: context.height*0.37,
    left: 0,
    right:0,
    child:Container(
    margin: EdgeInsets.symmetric(horizontal: context.width*0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create Account",
    style: AppStyles.nunito24Black,),
    SizedBox(height: context.height*0.002,),
    Text("Start your Egyptian adventure",
    style:AppStyles.regular16DarkGrayColor ,),
    SizedBox(height: context.height*0.02,),
                  Text("Full Name",
                    style: AppStyles.nunito16Black,),
                  CustomTextFeild(
                    filled: true,
                    prefixIcon: Icon(Icons.person,
                      color: AppColors.lightGrayColor,),
                    fillColor: AppColors.borderColor,
                    borderColor: AppColors.borderColor,
                  ),
                  SizedBox(height: context.height*0.02,),


                  Text("Email",
                    style: AppStyles.nunito16Black,),
                  CustomTextFeild(
                    filled: true,
                    prefixIcon: Icon(Icons.email_outlined,
                      color: AppColors.lightGrayColor,),
                    fillColor: AppColors.borderColor,
                    borderColor: AppColors.borderColor,
                  ),
                  SizedBox(height: context.height*0.02,),
      Text('Password',
        style: AppStyles.nunito16Black,),
      CustomTextFeild(
        filled: true,
        fillColor: AppColors.borderColor,
        borderColor: AppColors.borderColor,
        prefixIcon: Icon(
          Icons.lock,
          color: AppColors.lightGrayColor,
          size: 20,
        ),
      ),
                  SizedBox(height: context.height*0.02,),
                  CustomButton(
                      onPressed: (){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                                builder: (_)=> HomeScreen()));
                      },
                      borderRadius: BorderRadius.circular(34),
                      child: Text('Sign Up',
                        style: AppStyles.regular16WhiteColor,)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have account?',
                        style:AppStyles.regular16DarkGrayColor,
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                  builder: (_)=> LoginScreen()));
                        },
                        child: Text('Sign In',
                            style: AppStyles.regular16MainColor
                        ),
                      ),

                    ],
                  ),
                ],
              ),
    )

      ),
                ]
      )
    );
  }
}
