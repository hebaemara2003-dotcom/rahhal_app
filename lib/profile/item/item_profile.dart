import 'package:flutter/material.dart';
import 'package:rahhal_app/utils/app_colors.dart';
import 'package:rahhal_app/utils/app_styles.dart';
import 'package:rahhal_app/utils/screen_size.dart';

class ItemProfile extends StatelessWidget {
  String text;
  Widget icon;
  final VoidCallback onTap;
   ItemProfile({super.key,
  required this.text,
   required this.icon,
   required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 22
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 4))
          ]
      ),
      child: Row(
        children: [
          Container(
            width: context.width*0.12,
            height: context.height*0.06,
            decoration: BoxDecoration(
              color: AppColors.lightColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child:icon
          ),
          SizedBox(width: context.width*0.08,),
          Text(text,
          style:TextStyle(
            color: Colors.black.withOpacity(.77),
            fontSize: 16,
          ),),
          Spacer(),
          IconButton(
              onPressed: onTap
              , icon: Icon(Icons.arrow_forward_ios_outlined,
          color: AppColors.darkGrayColor,
          size: 18,))
        ],
      ),
    );
  }
}
