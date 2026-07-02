import 'package:flutter/material.dart';

import '../onBoarding_screen/custom_button.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class RegItem extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final String discription;

  final VoidCallback onFirstPressed;
  final VoidCallback onSecondPressed;

  const RegItem({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.discription,
    required this.onFirstPressed,
    required this.onSecondPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.person, color: AppColors.cyanColor),
            Text(
              discription,
              style: AppStyles.nunito20Black,
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                fillColor: AppColors.whiteColor,
                onPressed: onFirstPressed,
                borderRadius: BorderRadius.circular(10),
                child: Text(textOne),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: CustomButton(
                fillColor: AppColors.whiteColor,
                onPressed: onSecondPressed,
                borderRadius: BorderRadius.circular(10),
                child: Text(textTwo),
              ),
            ),
          ],
        ),
      ],
    );
  }
}