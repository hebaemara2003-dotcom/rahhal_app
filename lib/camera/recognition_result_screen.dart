import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rahhal_app/api/image_recognition.dart';
import 'package:rahhal_app/model_api/image_recognition/image_recognition_response.dart';
import 'package:rahhal_app/onBoarding_screen/custom_button.dart';
import 'package:rahhal_app/utils/app_assets.dart';
import 'package:rahhal_app/utils/app_styles.dart';
import 'package:rahhal_app/utils/screen_size.dart';

import '../utils/app_colors.dart';

class RecognitionResultScreen extends StatelessWidget {
  final File? imageFile;
  final ImageRecognitionResponse result;
   RecognitionResultScreen({super.key,
   required this.imageFile,
   required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monument Recognized"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.greenColor,
              child: Icon(
                Icons.check,
                color: AppColors.whiteColor ,
                size: 40,
              ),
            ),

             SizedBox(height: context.height*0.02,),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: imageFile != null
                  ? Image.file(
                imageFile!,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              )
                  : Image.asset(
                AppAssets.aboEllHoolImage,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

             SizedBox(height: context.height*0.03
             ),

            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                     Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Great Sphinx of Giza",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                     SizedBox(height: context.height*0.02),

                    Row(
                      children:  [
                        Container(
                            width: context.width*0.12,
                            height: context.height*0.06,
                            decoration: BoxDecoration(
                                color: AppColors.lightColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(
                              Icons.attach_money,
                              color: Colors.cyan,
                            ),
                        ),

                        SizedBox(width: 10),
                        Text(
                          "Ticket Price : 240 EGP",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),

                    SizedBox(height: context.height*0.02),

                    Row(
                      children:  [
                        Container(
                          width: context.width*0.12,
                          height: context.height*0.06,
                          decoration: BoxDecoration(
                              color: AppColors.lightColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:Icon(
                            Icons.access_time,
                            color: Colors.cyan,
                          ),
                        ),

                        SizedBox(width: 10),
                        Text(
                          "8:00 AM - 5:00 PM",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: context.height*0.02),

            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: const [

                    Text(
                      "Historical Background",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 12),

                    Text(
                      "The Great Sphinx of Giza is a limestone statue with the body of a lion and the head of a human. It is one of the most famous monuments in Egypt and attracts millions of visitors every year.",
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: context.height*0.03),
             CustomButton(
                 onPressed: (){
                   //todo:
                 }, 
                 borderRadius: BorderRadius.circular(50),
                 child: Text("view Details",
                 style: AppStyles.nunito16White,)),


             SizedBox(height: context.height*0.02),

        CustomButton(
          onPressed: (){

        },
          borderRadius: BorderRadius.circular(44),
          fillColor: AppColors.whiteColor,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt_rounded,
                color: AppColors.lightMainColor,
                size: 15,),
              SizedBox(width: context.width*0.02,),

              Text("Scan Another",
                style: AppStyles.nunito16LightMainColor,),

            ],
        ),
      ),
        ],

        ),
      )
    );
  }
}