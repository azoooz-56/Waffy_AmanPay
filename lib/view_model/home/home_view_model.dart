import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waffy_clone/models/transaction_model_freezed/transaction_model.dart';
import 'package:waffy_clone/services/auth.dart';
import 'package:waffy_clone/services/database.dart';

void handleSignOut() {
  Auth.signOut();
}

final transactionProvider = FutureProvider<List<TransactionModel>>((ref) async {
  List<TransactionModel> res = await Database.fetchTransactionsTable();
  return res;
});



// Future<List<TransactionModel>> handleActiveTransactions() async {
//   List<TransactionModel> res = await Database.fetchTransactionsTable();
//
//   return res;
// }
//
