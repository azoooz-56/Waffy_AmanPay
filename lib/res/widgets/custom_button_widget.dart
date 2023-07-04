import 'package:flutter/material.dart';
import 'package:waffy_clone/res/color.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String text;
  final bool? isSecondary;
  final bool? isSuccess;
  final bool? isDanger;
  final bool? isWarning;
  final bool? isAbsher;

  const CustomButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isSecondary,
    this.isSuccess,
    this.isDanger,
    this.isWarning,
    this.isAbsher
  }) : super(key: key);

  ButtonStyle getBtnStyle() {
    if(isSecondary == true){
      return ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryBtnColor,
          elevation: 0.0
      );
    }
    if(isSuccess == true){
      return ElevatedButton.styleFrom(
          backgroundColor: AppColors.successBtnColor,
          elevation: 0.0
      );
    }
    if(isDanger == true){
      return ElevatedButton.styleFrom(
          backgroundColor: AppColors.dangerBtnColor,
          elevation: 0.0
      );
    }
    if(isWarning == true){
      return ElevatedButton.styleFrom(
          backgroundColor: AppColors.warningBtnColor,
          elevation: 0.0
      );
    }
    if(isAbsher == true){
      return ElevatedButton.styleFrom(
          backgroundColor: AppColors.absherBtnColor,
          elevation: 0.0
      );
    }

    return ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBtnColor,
        elevation: 0.0
    );
  }

  TextStyle getTextStyle() {
    if(isSecondary == true){
      return const TextStyle(
          color: AppColors.secondaryTextColor
      );
    }
    if(isSuccess == true){
      return const TextStyle(
          color: AppColors.successTextColor
      );
    }
    if(isDanger == true){
      return const TextStyle(
          color: AppColors.dangerTextColor
      );
    }
    if(isWarning == true){
      return const TextStyle(
          color: AppColors.warningTextColor
      );
    }
    if(isAbsher == true){
      return const TextStyle(
          color: AppColors.absherTextColor
      );
    }

    return const TextStyle(
        color: AppColors.primaryTextColor
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: getBtnStyle(),
        child: Text(
            text,
            style: getTextStyle()
        ),
      ),
    );
  }
}
