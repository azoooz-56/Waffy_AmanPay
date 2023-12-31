import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:waffy_clone/models/transaction_model_freezed/transaction_model.dart';
import 'package:waffy_clone/models/user_models_freezed/user_model.dart';
import 'package:waffy_clone/res/color.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:another_flushbar/flushbar.dart';
// import 'package:another_flushbar/flushbar_route.dart';

class Utils {
  static toastMessage(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: color,
        textColor: AppColors.blackColor,
        toastLength: Toast.LENGTH_SHORT);
  }

//   static void flushBarErrorMessage(String message, BuildContext context) {
//     showFlushbar(
//         context: context,
//         flushbar: Flushbar(
//           forwardAnimationCurve: Curves.decelerate,
//           reverseAnimationCurve: Curves.easeOut,
//           flushbarPosition: FlushbarPosition.TOP,
//           positionOffset: 20,
//           borderRadius: BorderRadius.circular(8),
//           icon: const Icon(Icons.error),
//           margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           padding: const EdgeInsets.all(10),
//           message: message,
//           duration: const Duration(seconds: 3),
//           backgroundColor: Colors.red,
//         )..show(context));
//   }

//   static snackBar(String message, BuildContext context) {
//     return ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(backgroundColor: Colors.red, content: Text(message)));
//   }

//   static void fieldFocusChange(
//       BuildContext context, FocusNode current, FocusNode nextFocus) {
//     current.unfocus();
//     FocusScope.of(context).requestFocus(nextFocus);
//   }

  static bool hasFirstAndLastName(String fullName) {
    List<String> words = fullName.trim().split(' ');
    return words.length >= 2;
  }

  static String? validateEmpty(String? value) {
    if (value!.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    return null; // Return null if the value is not empty
  }

  static double computeTotalPrise(double value){
    double percentage = 0.04;
    return (value * percentage) + value;
  }

  static bool isStringEmpty(String str) {
    return str.trim().isEmpty;
  }

  static bool containsOnlyNumbers(String str) {
    const pattern = r'^[0-9]+$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(str);
  }

  static bool containsOnlyLetters(String str) {
    const pattern = r'^[a-zA-Z]+$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(str);
  }

  static bool containsOnlyLettersAndSpaces(String str) {
    const pattern = r'^[a-zA-Z\s]+$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(str);
  }

  static String capitalizeFirstLetter(String text) {
    if (text == null || text.isEmpty) {
      return text;
    }
    return text.substring(0, 1).toUpperCase() + text.substring(1);
  }

  static bool isEmailValid(String email) {
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return password.length >= 8;
  }

  static String formatPhoneNumber(String phoneNumber) {
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D+'), '');

    if (phoneNumber.length == 10 && phoneNumber.startsWith('05')) {
      return '+966${phoneNumber.substring(1)}';
    } else if (phoneNumber.length == 9 && phoneNumber.startsWith('5')) {
      return '+966$phoneNumber';
    } else {
      return '';
    }
  }

  static String? validatePhone(String? value) {
    var input = value!.trim();

    if (isStringEmpty(input)) {
      return 'يرجى إدخال رقم الجوال';
    }
    if(input.length < 9 || input.length > 10){
      return 'يرجى إدخال رقم جوال صحيح';
    }
    if (input.length == 10 && !input.startsWith('05') || input.length == 9 && !input.startsWith('5')) {
      return 'يجب إدخال رقم جوال يبدء ب 5 أو 05';
    }
    return '';
  }

  static String? validateName(String? value) {
    var input = value!.trim();

    if (isStringEmpty(input)) {
      return 'يرجى إدخال الاسم';
    }
    return null;
  }

  static String? validateAbsherNumber(String? value) {
    var input = value!.trim();

    if (isStringEmpty(input)) {
      return 'يرجى إدخال الرقم القومي أو رقم الاقامة';
    }
    if(input.length != 10){
      return 'يرجى إدخال رقم صحيح';
    }
    if(!input.startsWith('2') && !input.startsWith('1')){
      return 'يجب إدخال رقم يبدء ب 1 أو 2';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    var input = value!.trim();

    if (isStringEmpty(input)) {
      return 'يرجى إدخال البريد الإلكتروني';
    }
    if (!isEmailValid(input)) {
      return 'الرجاء إدخال بريد إلكتروني صحيح';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    var input = value!.trim();

    if (isStringEmpty(input)) {
      return 'يرجى إدخال الرقم السري';
    }
    if (!isPasswordValid(input)) {
      return 'الرجاء إدخال رقم سري صحيح';
    }
    return null;
  }

  static String? validatePasswordConfirmation(String? value, String? password) {
    var input = value!.trim();

    if (isStringEmpty(input)) {
      return 'يرجى إدخال الرقم السري';
    }
    if (!isPasswordValid(input)) {
      return 'الرجاء إدخال رقم سري صحيح';
    }
    if(input != password){
      return 'الرجاء التاكد من تطابق الرقم السري';
    }
    return null;
  }

   static String validatePasscode(List<String> passwordDigits) {
    if (!passwordDigits.every((digit) => digit.isNotEmpty)) {
      return 'الرجاء أدخل الرقم السري';
    }
    return '';
  }

  static String validatePasscodeConfirm(List<String> passcodeDigits, String passcode) {
    if (!passcodeDigits.every((digit) => digit.isNotEmpty)) {
      return 'الرجاء أدخل الرقم السري';
    }
    if (passcodeDigits.reversed.join().toString() != passcode) {
      return 'يرجى إدخال رقم سري صحيح';
    }
    return '';
  }

  static Future<String> convertToArabicDate(String dateTimeString) async {
    await initializeDateFormatting('ar');
    final parsedDateTime = DateTime.parse(dateTimeString);
    final formatter = DateFormat('EEEE، d MMMM، y', 'ar');
    return formatter.format(parsedDateTime);
  }

  static String getTotalTransactionPrice(TransactionModel transaction) {
    return (transaction.price + transaction.benefits_price).toString();
  }

  static String getUserFullname(UserModel user) {
    return '${user.fname} ${user.lname}';
  }
  static buildLoading(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        });
  }
}