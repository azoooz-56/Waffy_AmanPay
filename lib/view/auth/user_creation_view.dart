import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/widgets/passcode_form_widget.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/res/widgets/absher_form_widget.dart';
import 'package:waffy_clone/res/widgets/name_form_widget.dart';
import 'package:waffy_clone/res/widgets/phone_form_widget.dart';
import 'package:waffy_clone/view_model/home/home_view_model.dart';

class UserCreationView extends HookWidget {
  const UserCreationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> pageNumber = useState(1);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                left: displayWidth(context) * 0.05,
                right: displayWidth(context) * 0.05,
                bottom: displayWidth(context) * 0.1,
                top: displayWidth(context) * 0.01
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          if(pageNumber.value != 1){
                            pageNumber.value--;
                          }else{
                            // TODO: Add sign out
                            handleSignOut();
                          }
                        },
                        icon: const Icon(Icons.arrow_back_ios_rounded)
                    ),
                    Container(
                      height: 7.0,
                      width: displayWidth(context)*0.65,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: LinearProgressIndicator(
                          value: pageNumber.value/5,
                          backgroundColor: AppColors.lightGreyColor,
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                    ),
                    Text(
                      '${pageNumber.value}/4'
                    )
                  ],
                ),
                SizedBox(
                  height: displayHeight(context)*0.02,
                ),
                pageNumber.value == 1 ? NameFormWidget(pageNumber: pageNumber) :
                pageNumber.value == 2 ? PhoneFormWidget(pageNumber: pageNumber) :
                pageNumber.value == 3 ? PasscodeFormWidget(pageNumber: pageNumber) :
                AbsherFormWidget(pageNumber: pageNumber)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
