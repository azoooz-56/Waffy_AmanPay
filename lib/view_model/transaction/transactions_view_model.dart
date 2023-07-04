import 'package:waffy_clone/models/transaction_model_freezed/transaction_model.dart';
import 'package:waffy_clone/models/user_models_freezed/user_model.dart';
import 'package:waffy_clone/services/database.dart';

dynamic handleCreateTransaction(
    String? name,
    String? description,
    double? price,
    double? benefitsPrice,
    String? receiverEmail
) async {
  final res = await Database.insertTransactionsRow(
      name: name,
      description: description,
      price: price,
      benefitsPrice: benefitsPrice,
      receiverEmail: receiverEmail
  );

  return res;
}

Future<TransactionModel?> handleFetchTransaction(String id) async {
  TransactionModel data = await Database.fetchTransaction(id);

  return data;
}

Future<UserModel?> handleFetchUser(String uuid) async {
  UserModel data = await Database.fetchUser(uuid);

  return data;
}
