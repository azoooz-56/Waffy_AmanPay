import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/res/widgets/main_button_widget.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';

class FinishTransactionView extends StatelessWidget {
  const FinishTransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, actions: [
        IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: const Icon(Icons.close))
      ]),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05, vertical: displayHeight(context) * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset('assets/images/finish_transaction.png'),
                SizedBox(
                  height: displayHeight(context) * 0.05,
                ),
                Text(
                  'تم إنشاء طلبك بنجاح!',
                  style: AppStyle.instance.h5Bold,
                ),
              ],
            ),
            MainButtonWidget(
              onPressed: () {
                context.go('/home');
              },
              text: 'العودة للصفحة الرئيسية',

            ),
          ],
        ),
      ),
    );
  }
}
