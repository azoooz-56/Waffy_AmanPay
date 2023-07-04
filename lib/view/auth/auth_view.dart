import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/style/text_style.dart';

import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view/auth/login_view.dart';
import 'package:waffy_clone/view/auth/sign_up_view.dart';

class AuthView extends HookWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showLogin = useState(true);

    void toggleView() {
      showLogin.value = !showLogin.value;
    }

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.blackColor,
          ),
          onPressed: () {
            context.replace('/onBoarding');
          },
        ),
        title: Text(
          'أهلا بك في وفي',
          style: AppStyle.instance.h4Bold,
        ),
      ),
      body: SingleChildScrollView(
        child: showLogin.value ? LoginView(toggleView: toggleView) : SignUpView(toggleView: toggleView),
      ),
    );
  }
}
