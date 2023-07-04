
import 'package:flutter/material.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: displayWidth(context),
      color: AppColors.lightGreyColor,
    );
  }
}
