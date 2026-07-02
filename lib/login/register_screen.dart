import 'package:flutter/material.dart';
import 'package:rahhal_app/home/home_screen.dart';
import 'package:rahhal_app/login/login_screen.dart';
import 'package:rahhal_app/utils/app_assets.dart';
import 'package:rahhal_app/widget/reg_item.dart';

import '../api/reg_api.dart';
import '../custom/custom_text_field.dart';
import '../onBoarding_screen/custom_button.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import '../utils/screen_size.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isEgyptian = true;
  bool isStudent = true;
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Image.asset(AppAssets.registerScreenImage,
              width: double.infinity,
              fit: BoxFit.cover,),

            SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: context.width*0.08),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.height*0.35,),
                      Text("Create Account",
                        style: AppStyles.nunito24Black,),
                      SizedBox(height: context.height*0.002,),
                      Text("Start your Egyptian adventure",
                        style:AppStyles.regular16DarkGrayColor ,),
                      SizedBox(height: context.height*0.02,),
                      Text("Full Name",
                        style: AppStyles.nunito16Black,),
                      CustomTextFeild(
                        controller: fullNameController,
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
                        controller: emailController,
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
                        controller: passwordController,
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

                      RegItem(
                        textOne: "Egyptian",
                        textTwo: "Foreigner",
                        discription: "I am ",

                        onFirstPressed: () {
                          setState(() {
                            isEgyptian = true;
                          });
                        },

                        onSecondPressed: () {
                          setState(() {
                            isEgyptian = false;
                          });
                        },
                      ),
                      SizedBox(height: context.height*0.02,),
                      RegItem(
                        textOne: "Student",
                        textTwo: "Adult",
                        discription: "I want to sign up as ",

                        onFirstPressed: () {
                          setState(() {
                            isStudent = true;
                          });
                        },

                        onSecondPressed: () {
                          setState(() {
                            isStudent = false;
                          });
                        },
                      ),
                      SizedBox(height: context.height*0.02,),


                      CustomButton(
                          onPressed: () async {

                            var response = await register(
                              fullName: fullNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              isEgyptian: isEgyptian,
                              isStudent: isStudent,
                            );

                            if (response.statusCode == 200 || response.statusCode == 201) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => HomeScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Register Failed"),
                                ),
                              );
                            }
                          },
                          borderRadius: BorderRadius.circular(34),
                          child: Text('Sign Up',
                            style: AppStyles.regular16WhiteColor,)),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text('Already have account?',
                      //       style:AppStyles.regular16DarkGrayColor,
                      //     ),
                      //     TextButton(
                      //         onPressed: () async {
                      //           var response = await register(
                      //             fullName: fullNameController.text,
                      //             email: emailController.text,
                      //             password: passwordController.text,
                      //             isEgyptian: isEgyptian,
                      //             isStudent: isStudent,
                      //           );
                      //
                      //           if (response.statusCode == 200 ||
                      //               response.statusCode == 201) {
                      //             Navigator.pushReplacement(
                      //               context,
                      //               MaterialPageRoute(
                      //                 builder: (_) => const HomeScreen(),
                      //               ),
                      //             );
                      //           } else {
                      //             ScaffoldMessenger.of(context).showSnackBar(
                      //               SnackBar(
                      //                 content: Text("Register Failed"),
                      //               ),
                      //             );
                      //           }
                      //         },
                      //       child: Text('Sign In',
                      //           style: AppStyles.regular16MainColor
                      //       ),
                      //     ),
                      //
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            )


          ]
      ),
    );


  }
}
