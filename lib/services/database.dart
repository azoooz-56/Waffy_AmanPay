import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waffy_clone/models/transaction_model_freezed/transaction_model.dart';
import 'package:waffy_clone/models/user_models_freezed/user_model.dart';
final supabase = Supabase.instance.client;

class Database {

  // Users Table
  static dynamic fetchUsersTable() async {
    final data = await supabase.from('users').select('*').eq('uid', supabase.auth.currentUser!.id);
    return data;
  }

  static Future<UserModel> fetchCurrentUser() async {
    List<dynamic> data = await supabase.from('users').select('*')
        .eq('uid', supabase.auth.currentUser!.id);

    UserModel user = UserModel.fromJson(data[0]);

    return user;
  }

  static Future<UserModel> fetchUser(String uuid) async {
    List<dynamic> data = await supabase.from('users').select('*')
        .eq('uid', uuid);

    UserModel user = UserModel.fromJson(data[0]);

    return user;
  }

  static dynamic insertUserRow(String uid) async {
    return await supabase.from('users').insert({
      'uid': uid,
      'fname': '',
      'lname': '',
      'pid': '',
      'phone': '',
      'passcode': '',
      'rate': 0,
      'status': 'active'
    });
  }

  static Future<String> updateUserData({
    String? fname,
    String? lname,
    String? pid,
    String? phone,
    String? passcode,
    double? rate,
    String? status
  }) async {
    Map<String, dynamic> updatedData = {};

    if (fname != null) {
      updatedData['fname'] = fname;
    }
    if (lname != null) {
      updatedData['lname'] = lname;
    }
    if (pid != null) {
      updatedData['pid'] = pid;
    }
    if (phone != null) {
      updatedData['phone'] = phone;
    }
    if (passcode != null) {
      updatedData['passcode'] = passcode;
    }
    if(rate != null){
      updatedData['rate'] = rate;
    }
    if(status != null){
      updatedData['status'] = status;
    }

    if(supabase.auth.currentUser != null){
      await supabase.from('users')
          .update(updatedData)
          .eq('uid', supabase.auth.currentUser!.id);
      return '';
    }else{
      return 'حدث خطأ';
    }

  }

  static Future<String?> fetchPasscode() async {
    if(supabase.auth.currentUser != null){
      final data = await supabase.from('users')
          .select('*').eq('uid', supabase.auth.currentUser!.id)
          .select('passcode');
      print(data);
      var passcode = data[0]['passcode'];

      return passcode;
    }else{
      return null;
    }
  }

  // Transactions Table
  static dynamic fetchTransactionsTable() async {
    List<dynamic> data = await supabase.from('transactions').select('*')
        .or('uuid.eq.${supabase.auth.currentUser!.id}, receiver_email.eq.${supabase.auth.currentUser!.email}');

    List<TransactionModel> list = [];

    for(int i = 0; i < data.length; i++){
      list.add(TransactionModel.fromJson(data[i]));
    }

    return list;
  }

  static Future<TransactionModel> fetchTransaction(String id) async {
    List<dynamic> data = await supabase.from('transactions').select('*')
        .eq('id', id);

    TransactionModel transaction = TransactionModel.fromJson(data[0]);

    return transaction;
  }

  static dynamic insertTransactionsRow({
    String? name,
    String? description,
    double? price,
    double? benefitsPrice,
    String? receiverEmail
  }) async {
    return await supabase.from('transactions').insert({
      'name': name,
      'description': description,
      'price': price,
      'benefits_price': benefitsPrice,
      'receiver_email': receiverEmail,
      'image': '',
      'uuid': supabase.auth.currentUser!.id,
      'transaction_status': 'pending',
      'status': 'active'
    });
  }

}
