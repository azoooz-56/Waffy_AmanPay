import 'package:waffy_clone/models/user_models_freezed/user_model.dart';
import 'package:waffy_clone/services/auth.dart';
import 'package:waffy_clone/services/database.dart';

Future<UserModel?> handleFetchCurrentUser() async {
  final user = Database.fetchCurrentUser();

  return user;
}

Future<void> handleSignOut() async {
  await Auth.signOut();
}