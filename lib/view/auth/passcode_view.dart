import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/res/widgets/main_button_widget.dart';
import 'package:waffy_clone/utils/general_utils.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view_model/auth/passcode_view_model.dart';

class PasscodeView extends HookWidget {
  PasscodeView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> error = useState('');
    final isLoading = useState(false);

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

    return Scaffold(
      appBar: AppBar(),
      body: isLoading.value ? Center(child: CircularProgressIndicator(),) :SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: displayWidth(context) * 0.05, right: displayWidth(context) * 0.05, bottom: displayWidth(context) * 0.1, top: displayWidth(context) * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "أدخل الرقم السري",
                      textAlign: TextAlign.center,
                      style: AppStyle.instance.h4Bold,
                    ),
                    SizedBox(
                      height: displayHeight(context)*0.02,
                    ),
                    Text(
                      "من فضلك أدخل الرقم السري لمتابعة تسجيل الدخول",
                      textAlign: TextAlign.center,
                      style: AppStyle.instance.bodyXLarge,
                    ),
                    SizedBox(
                      height: displayHeight(context)*0.08,
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
                  ],
                ),
              ),
              SizedBox(
                height: displayHeight(context)*0.06,
              ),
              MainButtonWidget(
                onPressed: () async {
                  isLoading.value = true;
                  final userPasscode = await handleCheckPasscode();
                  isLoading.value = false;

                  error.value = Utils.validatePasscodeConfirm(
                      _digitControllers.map((controller) => controller.text).toList(),
                      userPasscode!
                  );

                  if (
                    error.value.isEmpty && userPasscode == _digitControllers.map((controller) => controller.text).toList().reversed.join()
                  ) {
                    if(userPasscode != null){
                      context.replace('/home');
                    }else{
                      error.value = 'حدث خطأ';
                    }
                  }
                },
                text: 'متابعة',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
