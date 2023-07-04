import 'package:flutter/material.dart';
import 'package:waffy_clone/models/dropdown_option_model.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/res/widgets/row_option_widget.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';

class DropdownOptionWidget extends StatelessWidget {
  final DropdownOption dropdownOptions;
  final bool hasUnderline;

  const DropdownOptionWidget({
    Key? key,
    required this.hasUnderline,
    required this.dropdownOptions
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.04,
                    vertical: displayHeight(context)* 0.02
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dropdownOptions.title,
                        style: AppStyle.instance.grayTextBold,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.darkGreyColor,
                      )
                    ]
                )
            ),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.04,
                    vertical: displayHeight(context)* 0.005
                ),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: AppColors.lightGreyColor,
                          offset: Offset(0, 2),
                          blurRadius: 20
                      )
                    ]
                ),
                child: Column(
                  children: dropdownOptions.options.map((option) {
                    final isLastItem = option == dropdownOptions.options.last;
                    return RowOptionWidget(
                      text: option.text,
                      icon: option.icon,
                      iconColor: option.iconColor,
                      hasUnderline: !isLastItem,
                      onTap: option.onTap,
                    );
                  }).toList(),
                )
            )
          ],
        ),
        hasUnderline ? SizedBox(height: displayHeight(context) * 0.01) : const SizedBox()
      ],
    );
  }
}
