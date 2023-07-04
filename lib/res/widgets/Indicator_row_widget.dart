
import 'package:flutter/material.dart';
import 'package:waffy_clone/res/color.dart';

class IndicatorRow extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const IndicatorRow({
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(pageCount, (index) {
        return Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? AppColors.blueColor : AppColors.lightGreyColor,
          ),
        );
      }),
    );
  }
}