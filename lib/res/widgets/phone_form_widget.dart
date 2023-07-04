import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/res/widgets/custom_button_widget.dart';
import 'package:waffy_clone/utils/general_utils.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view_model/auth/user_creation_view_model.dart';

class PhoneFormWidget extends HookWidget {
  final ValueNotifier<int> pageNumber;
  const PhoneFormWidget({Key? key, required this.pageNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneController = useTextEditingController();
    ValueNotifier<String> error = useState('');

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "أدخل رقم جوالك",
              textAlign: TextAlign.center,
              style: AppStyle.instance.h4Bold,
            ),
            SizedBox(
              height: displayHeight(context)*0.02,
            ),
            Text(
              "من فضلك أدخل رقمك",
              textAlign: TextAlign.center,
              style: AppStyle.instance.bodyXLarge,
            ),
            SizedBox(
              height: displayHeight(context)*0.08,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGreyColor),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: displayWidth(context)*0.55,
                    child: TextFormField(
                      controller: phoneController,
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        hintText: 'أدخل رقم الجوال',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AppColors.lightGreyColor,
                    ),
                  ),
                  Container(
                    width: displayWidth(context)*0.22,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('+966', style: AppStyle.instance.textBold,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0), // Set the desired radius
                          child: Image.asset(
                            'assets/images/saudi_arabia_flag.png',
                            width: 36.0,
                            height: 26.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: displayHeight(context)*0.02,
        ),
        Text(
          error.value.toString(),
          style: AppStyle.instance.errorMsg,
        ),
        SizedBox(
          height: displayHeight(context)*0.06,
        ),
        CustomButtonWidget(
          onPressed: () async {
            error.value = Utils.validatePhone(phoneController.text)!;
            if (error.value.isEmpty) {
              final formattedPhone = Utils.formatPhoneNumber(phoneController.text);
              if(formattedPhone.isNotEmpty){
                final res = await handleAddPhoneNumber(formattedPhone);

                if(res.isEmpty){
                  pageNumber.value++;
                }else{
                  error.value = res;
                }
              }
            }
          },
          text: 'متابعة',
        ),
      ],
    );
  }
}