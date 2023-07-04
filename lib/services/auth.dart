import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class Auth {

  static Future<AuthResponse?> signUp(String email, String password) async {
    try{
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      return res;
    }catch(e){
      print(e);
    }

    return null;
  }

  static Future<AuthResponse> signIn(String email, String password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return res;
  }

  static Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  static Future<Session?> retrieveSession() async {
    final Session? session = supabase.auth.currentSession;
    return session;
  }

  static Future<User?> retrieveUser() async {
    final User? user = supabase.auth.currentUser;
    return user;
  }

  static Future<UserResponse> updateUser() async {
    final UserResponse res = await supabase.auth.updateUser(
      UserAttributes(
        email: 'example@email.com',
        password: 'new password',
      ),
    );
    return res;
  }

  static void listenToAuthEvents() {
    final authSubscription = supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
    });
  }

  static void authEventHandller(goRouter){
    supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;

      if (event == AuthChangeEvent.signedIn) {
        // User signed in
        if(goRouter.location == '/auth'){
          goRouter.replace('/lock');
        }
      } else if (event == AuthChangeEvent.signedOut) {
        // User signed out
        if(goRouter.location != '/auth'){
          goRouter.replace('/onBoarding');
        }
      }else {
        // Other event types
        goRouter.replace('/onBoarding');
      }
    });
  }
}


