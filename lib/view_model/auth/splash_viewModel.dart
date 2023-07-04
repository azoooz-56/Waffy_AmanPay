import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreenViewModel extends ChangeNotifier {
  bool isLoading = true;

  Future<void> fetchData() async {
    // Simulating data fetch delay
    await Future.delayed(const Duration(seconds: 5));
    isLoading = false;
    notifyListeners();
  }
}

final splashScreenViewModelProvider = ChangeNotifierProvider<SplashScreenViewModel>(
      (ref) => SplashScreenViewModel(),
);
