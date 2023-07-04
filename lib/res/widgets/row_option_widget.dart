import 'package:flutter/material.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/style/text_style.dart';

class RowOptionWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? iconColor;
  final bool hasUnderline;
  final Function onTap;

  const RowOptionWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.hasUnderline,
    required this.onTap,
    this.iconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: iconColor ?? AppColors.blueColor, size: 30),
                const SizedBox(width: 10),
                Text(
                    text,
                    style: AppStyle.instance.textBold
                )
              ],
            ),
          ),
        ),
        hasUnderline ?
        Container(width: double.infinity, height: 1, color: AppColors.lightGreyColor,)
            : const SizedBox(),
      ],
    );
  }
}