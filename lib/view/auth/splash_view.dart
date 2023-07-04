import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/widgets/animate_logo.dart';
import 'package:waffy_clone/view_model/auth/splash_viewModel.dart';

final supabase = Supabase.instance.client;

class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashViewModel = ref.watch(splashScreenViewModelProvider);

    useEffect(() {
      if (splashViewModel.isLoading) {
        splashViewModel.fetchData().then((_) {
          if(supabase.auth.currentUser != null){
            context.replace('/lock');
          }else{
            context.replace('/onBoarding');
          }
        });
      }
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColors.whiteSplashColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedLogo(),
          ],
        ),
      ),
    );
  }
}
