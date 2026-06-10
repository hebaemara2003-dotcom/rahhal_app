import 'package:flutter/material.dart';
import 'package:rahhal_app/utils/app_colors.dart';
import 'package:rahhal_app/utils/app_styles.dart';
import 'package:rahhal_app/utils/screen_size.dart';

class CustomButton extends StatelessWidget {
  final bool isOutlined;
  final VoidCallback onPressed;
  Widget child;
  final Color fillColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final Icon? icon;
   CustomButton({super.key,
    this.isOutlined = false,
    this.fillColor = AppColors.lightMainColor,
    this.textColor = AppColors.whiteColor,
    this.icon,
    required this.child,
    required this.onPressed, required this.borderRadius,
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: context.height*0.01
                ),
                backgroundColor:fillColor,
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius,


                ),
              ),
              onPressed: onPressed,
              child: child,
              )

    );


  }
}
