import 'package:waffy_clone/services/database.dart';

Future<String> handleAddUsername(String fname, String lname) async {
  return await Database.updateUserData(fname: fname, lname: lname);
}

Future<String> handleAddPhoneNumber(String phone) async {
  return await Database.updateUserData(phone: phone);
}

Future<String> handleAddPasscode(String passcode) async {
  return await Database.updateUserData(passcode: passcode);
}

Future<String> handleAddAbsher(String pid) async {
  return await Database.updateUserData(pid: pid);
}