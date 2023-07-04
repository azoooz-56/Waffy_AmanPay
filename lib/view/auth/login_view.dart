import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/widgets/main_button_widget.dart';
import 'package:waffy_clone/utils/general_utils.dart';
import 'package:waffy_clone/view_model/auth/auth_view_model.dart';
import '../../utils/sizes_helpers.dart';

class LoginView extends HookWidget {
  final Function toggleView;

  LoginView({super.key, required this.toggleView});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);
    return isLoading.value
        ? Container(
            height: displayHeight(context),
            child: Center(
              child: CircularProgressIndicator(),
            ))
        : Container(
            margin: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: displayHeight(context) * 0.08,
                ),
                Form(
                    key: _formKey,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            validator: Utils.validateEmail,
                            decoration: const InputDecoration(
                              hintText: 'البريد الالكتروني',
                              prefixIcon: Icon(Icons.email_rounded),
                            ),
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.02,
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            validator: Utils.validatePassword,
                            decoration: const InputDecoration(
                              hintText: 'الرقم السري',
                              prefixIcon: Icon(Icons.password_rounded),
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: displayHeight(context) * 0.08,
                ),
                MainButtonWidget(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      isLoading.value = true;
                      await handleSignIn(emailController.text, passwordController.text);
                      isLoading.value = false;
                    }
                  },
                  text: 'تسجيل الدخول',
                ),
                GestureDetector(
                  onTap: () {
                    toggleView();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 18.0),
                    child: Text(
                      'لا يوجد لدي حساب، انشاء حساب',
                      style: TextStyle(color: AppColors.darkGreyColor, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
