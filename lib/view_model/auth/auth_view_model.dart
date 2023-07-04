import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/services/auth.dart';
import 'package:waffy_clone/services/database.dart';
import 'package:waffy_clone/utils/general_utils.dart';

Future<AuthResponse?> handleSignUp(String email, String password) async {

  try{
    AuthResponse? res = await Auth.signUp(email, password);
    if(res!.user != null){
      await Database.insertUserRow(res.user!.id);
      return res;
    }

  }catch(e){
    Utils.toastMessage("البريد الالكتروني مسجل مسبقا", AppColors.redColor);
    return null;
  }

}

Future<AuthResponse?> handleSignIn(String email, String password) async {

  try{
    AuthResponse res = await Auth.signIn(email, password);
    return res;
  }catch(e){
    Utils.toastMessage("لا يوجد حساب", AppColors.redColor);
    return null;
  }


}