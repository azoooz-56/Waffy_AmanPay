
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waffy_clone/models/Onboarding_model.dart';

final onboardingViewModelProvider =
ChangeNotifierProvider<OnboardingViewModel>((ref) => OnboardingViewModel());

class OnboardingViewModel extends ChangeNotifier {
  List<OnboardingModel> onboardingScreens = [
    OnboardingModel(
      imagePath: 'assets/images/first_onboarding.png',
      text1: 'ابدأ معاملاتك من خلال مجموعة من أقسامنا الأكثر شهرة',
      text2: 'ندعم أقسام سوق المستعمل : عقارات سيارات، أجهزة، كهربائية، وأثاث بالإضافة إلى، خدمات العمل الحر مثل: التصميم والبرمجة',
    ),OnboardingModel(
      imagePath: 'assets/images/second_onBoarding.png',
      text1: 'فريق متخصص لضمان حقوقك',
      text2: 'يتأكد فريق وفي من سلاسة عمليات البيع والشراء ورضي الطرفين',
    ),OnboardingModel(
      imagePath: 'assets/images/third_onBoarding.png',
      text1: 'استلم المنتج بأفضل جودة، واستلم مبلغ المعاملة بأمان وسهولة',
      text2: 'نوفر لك لوحة تحكم تمكنك من إدارة جميع معاملاتك بكل سهولة ',
    ),OnboardingModel(
      imagePath: 'assets/images/fourth_onBoarding.png',
      text1: 'توثيق الهوية من خلال أبشر، أطرافنا موثقين لتجنب الإحتيال',
      text2: 'يقوم وفّي بتأكيد هوية الأطراف لتوثيق الحسابات من خلال التعامل مع خدمات حكومية مثل أبشر',
    ),
  ];

}