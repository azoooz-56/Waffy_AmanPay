import 'package:waffy_clone/services/database.dart';

Future<bool>? handleCheckUserData() async {
  try{
    var res = await Database.fetchPasscode();
    if (res != null && res.length == 6) {
      return true;
    }
    return false;
  }catch(e){
    return false;
  }

}