import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waffy_clone/res/app_theme.dart';
import 'package:waffy_clone/res/router.dart';
import 'package:waffy_clone/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  runApp(ProviderScope(child: MyApp()));
}


Future<void> initializeApp() async {
  await dotenv.load(fileName: "lib/.env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

}

class MyApp extends ConsumerWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final goRouter = ref.watch(GoRouteProvider);

    Auth.authEventHandller(goRouter);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: AppTheme().appTheme(),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
