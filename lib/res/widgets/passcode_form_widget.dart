
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/res/widgets/custom_button_widget.dart';
import 'package:waffy_clone/utils/general_utils.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view_model/auth/user_creation_view_model.dart';

class PasscodeFormWidget extends HookWidget {
  final ValueNotifier<int> pageNumber;
  const PasscodeFormWidget({super.key, required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> error = useState('');
    ValueNotifier<String> passcode = useState('');

    final isConfirm = useState(false);

    final List<TextEditingController> _digitControllers = useMemoized(
          () => List.generate(6, (index) => TextEditingController()),
    );
    final List<FocusNode> _digitFocusNodes = useMemoized(
          () => List.generate(6, (index) => FocusNode()),
    );

    void _moveToPreviousField(int currentIndex) {
      if(error.value.isNotEmpty){
        error.value = '';
      }
      if (currentIndex > 0) {
        _digitFocusNodes[currentIndex].unfocus();
        FocusScope.of(context).requestFocus(_digitFocusNodes[currentIndex - 1]);
      } else {
        _digitFocusNodes[currentIndex].unfocus();
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Column(
            children: [
              Text(
                "${isConfirm.value ? 'أعد إدخال' : 'قم بتحديد'} الرقم السري",
                textAlign: TextAlign.center,
                style: AppStyle.instance.h4Bold,
              ),
              SizedBox(
                height: displayHeight(context)*0.02,
              ),
              Text(
                "سنطلبه منك لتأكيد أي معاملة تقوم بها",
                textAlign: TextAlign.center,
                style: AppStyle.instance.bodyXLarge,
              ),
              SizedBox(
                height: displayHeight(context)*0.08,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < 6; i++)
              Container(
                width: displayWidth(context) * 0.13,
                margin: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.01),
                child: TextFormField(
                  controller: _digitControllers[i],
                  maxLength: 1,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: '',
                    contentPadding: EdgeInsets.only(right: displayWidth(context) * 0.05, top: 17, bottom: 17),
                  ),
                  focusNode: _digitFocusNodes[i],
                  onChanged: (value) => _moveToPreviousField(i),
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
            if(isConfirm.value){
              error.value = Utils.validatePasscodeConfirm(
                  _digitControllers.map((controller) => controller.text).toList(),
                  passcode.value
              );
              if (
                error.value.isEmpty &&
                passcode.value == _digitControllers.map((controller) => controller.text).toList().reversed.join()
              ) {
                final res = await handleAddPasscode(passcode.value);

                if(res.isEmpty){
                  pageNumber.value++;
                }else{
                  error.value = res;
                }
              }
            }else{
              error.value = Utils.validatePasscode(
                  _digitControllers.map((controller) => controller.text).toList()
              );
              if (error.value.isEmpty) {
                passcode.value = _digitControllers.map((controller) => controller.text).toList().reversed.join();
                for (var controller in _digitControllers) {
                  controller.clear();
                }
                isConfirm.value = true;
              }
            }
          },
          text: '${isConfirm.value ? 'تأكيد' : 'تعيين'} الرقم السري',
        ),
        SizedBox(
          height: isConfirm.value ? displayHeight(context)*0.02 : 0,
        ),
        isConfirm.value ? CustomButtonWidget(
          onPressed: () {
            for (var controller in _digitControllers) {
              controller.clear();
            }
            passcode.value = '';
            isConfirm.value = false;
          },
          isSecondary: true,
          text: 'تغيير الرقم السري'
        ) : SizedBox()
      ],
    );
  }
}




