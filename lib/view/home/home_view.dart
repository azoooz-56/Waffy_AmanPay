import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/res/widgets/bar_home_widget.dart';
import 'package:waffy_clone/res/widgets/card_transaction_widget.dart';
import 'package:waffy_clone/res/widgets/main_button_widget.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view_model/home/home_view_model.dart';
class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionList = ref.watch(transactionProvider);

    useEffect(() {
      ref.refresh(transactionProvider);
    }, []);

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05),
        child: SingleChildScrollView(
          child: transactionList.when(
            loading: () {
              // Show loading indicator while fetching data
              return Center(child: CircularProgressIndicator());
            },
            error: (error, stack) {
              // Handle error state
              return Text('Error: $error');
            },
            data: (transactionList) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BarHomeWidget(),
                  const SizedBox(height: 10),
                  Text(
                    "المعاملات النشطة",
                    style: AppStyle.instance.h5Bold,
                  ),
                  const SizedBox(height: 10),
                  RefreshIndicator(
                    onRefresh: () async {
                      ref.refresh(transactionProvider);
                    },
                    child: transactionList.isNotEmpty
                        ? ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: transactionList
                          .map((transaction) => CardTransactionWidget(
                        transaction: transaction,
                      ))
                          .toList(),
                    )
                        : Column(
                      children: [
                        SizedBox(height: displayHeight(context) * 0.1),
                        Image.asset('assets/images/home_image2.png'),
                        SizedBox(height: displayHeight(context) * 0.1),
                        Text(
                          'لايوجد لديك أي معاملات',
                          style: AppStyle.instance.h5Bold,
                        ),
                        SizedBox(height: displayHeight(context) * 0.04),
                        Text(
                          'نحمي كل معاملاتك، لضمان الجودة المتفق عليها',
                          style: AppStyle.instance.bodyXLarge,
                        ),
                        SizedBox(height: displayHeight(context) * 0.05),
                        MainButtonWidget(
                          onPressed: () {
                            context.go("/home/create_transaction");
                          },
                          text: 'ابدأ معاملتك الأولى الان',
                        ),
                        SizedBox(height: displayHeight(context) * 0.05),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
