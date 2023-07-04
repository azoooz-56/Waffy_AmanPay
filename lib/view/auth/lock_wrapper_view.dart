import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/widgets/animate_logo.dart';
import 'package:waffy_clone/view/auth/passcode_view.dart';
import 'package:waffy_clone/view/auth/user_creation_view.dart';
import 'package:waffy_clone/view_model/auth/lock_wrapper_view_model.dart';

class LockWrapperView extends HookWidget {
  const LockWrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasPasscode = useState<bool?>(null);

    useEffect(() {
      handleCheckUserData()?.then((result) {
        hasPasscode.value = result;
      });
    }, []);

    if (hasPasscode.value == null) {
      return const Scaffold(
        backgroundColor: AppColors.whiteSplashColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator(),),
            ],
          ),
        ),
      );
    } else if (hasPasscode.value!) {
      return PasscodeView();
    } else {
      return const UserCreationView();
    }
  }
}