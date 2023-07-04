import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/res/widgets/Indicator_row_widget.dart';
import 'package:waffy_clone/res/widgets/main_button_widget.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view_model/auth/onBoarding_viewModel.dart';

class OnBoardingView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final pageController = usePageController();
    final currentPage = useState(0);
    final onBoardingviewModel = ref.watch(onboardingViewModelProvider);

    useEffect(() {
      pageController.addListener(() {
        currentPage.value = pageController.page!.toInt();
      });
    }, []);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: displayHeight(context) * 0.02,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: displayWidth(context) * 0.3,
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onBoardingviewModel.onboardingScreens.length,
                itemBuilder: (context, index) {
                  final onboardingModel = onBoardingviewModel.onboardingScreens[index];

                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(onboardingModel.imagePath),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.07),
                          child: Column(
                            children: [
                              Text(onboardingModel.text1, style: AppStyle.instance.h5Bold, textAlign: TextAlign.center),
                              Text(onboardingModel.text2, style: AppStyle.instance.bodyMedium, textAlign: TextAlign.center),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            IndicatorRow(currentPage: currentPage.value, pageCount: onBoardingviewModel.onboardingScreens.length),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: displayHeight(context) * 0.05),
              child: MainButtonWidget(
                  onPressed: () {
                    context.go("/auth");
                  },
                  text: 'تسجيل الدخول',
                  ),
            )
          ],
        ),
      ),
    );
  }
}
