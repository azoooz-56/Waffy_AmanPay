import 'package:waffy_clone/services/database.dart';

Future<String?> handleCheckPasscode() async {
  return await Database.fetchPasscode();
}