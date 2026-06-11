import 'package:flutter/material.dart';
import 'package:rahhal_app/login/login_screen.dart';
import 'package:rahhal_app/utils/app_assets.dart';
import 'package:rahhal_app/utils/app_routes.dart';
import 'package:rahhal_app/utils/app_styles.dart';
import 'package:rahhal_app/utils/screen_size.dart';

import '../custom/custom_text_field.dart';
import '../onBoarding_screen/custom_button.dart';
import '../utils/app_colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: Column(
          children: [
            SafeArea(child: Row(
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_)=> LoginScreen()));
                    },
                    icon: Icon(Icons.arrow_back,
                      size: 25,
                      color: AppColors.blackColor,)),
                Text("Back to Sign In",
                  style: AppStyles.regular16LightGrayColor,)
              ],
            ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    top: context.height*0.10,
                      right: 0,
                      left: 0,
                      child: SizedBox(
                        // height: context.height*0.3,
                        child: Image.asset(AppAssets.resetImage,
                          fit: BoxFit.cover,),
                      )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: context.width*0.07),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: context.height*0.2,),

                        Text('Reset Password',
                                style: AppStyles.nunito24Black,),
                    Text("Enter your email to receive reset instructions",
                            style: AppStyles.regular16LightGrayColor,),
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
                        CustomButton(
                            onPressed: (){
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (_)=> LoginScreen()));
                            },
                            borderRadius: BorderRadius.circular(34),
                            child: Text('Send Reset Link',
                              style: AppStyles.regular16WhiteColor,)),


                    ],),
                  )
                    ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
