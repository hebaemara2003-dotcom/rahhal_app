import 'package:flutter/material.dart';
import 'package:rahhal_app/custom/custom_text_field.dart';
import 'package:rahhal_app/home/home_screen.dart';
import 'package:rahhal_app/login/register_screen.dart';
import 'package:rahhal_app/login/reset_password_screen.dart';
import 'package:rahhal_app/onBoarding_screen/custom_button.dart';
import 'package:rahhal_app/utils/app_assets.dart';
import 'package:rahhal_app/utils/app_colors.dart';
import 'package:rahhal_app/utils/app_styles.dart';
import 'package:rahhal_app/utils/screen_size.dart';

import '../utils/app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(AppAssets.loginScreenImage,
                fit: BoxFit.cover,)
          ),
          Positioned(
            top: context.height*0.48,
              left: 0,
              right:0,
              child:Container(
                margin: EdgeInsets.symmetric(horizontal: context.width*0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Welcome Back",
                  style: AppStyles.nunito24Black,),
                    SizedBox(height: context.height*0.01,),

                   Text("Sign in to continue your journey",
                     style:AppStyles.regular16DarkGrayColor ,),
                    SizedBox(height: context.height*0.03,),

                    Text("Email",
                      style: AppStyles.nunito16Black,),
                    CustomTextFeild(
                      filled: true,
                      prefixIcon: Icon(Icons.email_outlined,
                        color: AppColors.lightGrayColor,),
                      hintText: 'yourname@gmail.com',
                      hintStyle: AppStyles.regular16LightGrayColor,
                      fillColor: AppColors.borderColor,
                      borderColor: AppColors.borderColor,
                    ),
                SizedBox(height: context.height*0.03,),
                Text('Password',
                style: AppStyles.nunito16Black,),
                CustomTextFeild(
                  filled: true,
                  fillColor: AppColors.borderColor,
                  borderColor: AppColors.borderColor,
                  hintText: '........',
                  hintStyle: AppStyles.regular16LightGrayColor,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.lightGrayColor,
                    size: 25,
                  ),
                ),
                    SizedBox(height: context.height*0.01,),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                                builder: (_)=> ResetPasswordScreen()));
                      },
                      child: Text(
                        'Forget Password?',
                        textAlign: TextAlign.right,
                        style: AppStyles.regular16cyanColor,
                        // style: TextStyle(
                        //   color: AppColors.cyanColor,
                          // decoration: TextDecoration.underline,
                          // decorationColor: AppColors.mainDarkColor,
                          // decorationThickness: 2,
                        ),
                      ),
                    CustomButton(
                        onPressed: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                  builder: (_)=> HomeScreen()));
                        },
                         borderRadius: BorderRadius.circular(16),
                        child: Text('Sign In',
                        style: AppStyles.regular16WhiteColor,)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don’t have an account?',
                          style:AppStyles.regular16DarkGrayColor,
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (_)=> RegisterScreen()));
                          },
                          child: Text('Sign Up',
                            style: AppStyles.regular16MainColor
                            ),
                          ),

                      ],
                    ),


                  ],
                    ),
              )
          )
        ],
      ),
    );
  }
}
