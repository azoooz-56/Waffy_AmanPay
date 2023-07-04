import 'package:flutter/material.dart';

import '../color.dart';
import '../style/text_style.dart';

class BarHomeWidget extends StatelessWidget {
  const BarHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text('أهلا بك،',style: AppStyle.instance.bodyXLarge,  ),
            Row(
              children: [
                Icon(Icons.star,color: AppColors.goldColor,),
                SizedBox(width: 5,),
                Text("0", style: AppStyle.instance.bodyXLarge),
              ],
            )
          ],
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Icon(
                Icons.notifications_active_outlined
            ),
          ),
        )
      ],
    );
  }
}
