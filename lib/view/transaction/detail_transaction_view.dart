import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:waffy_clone/models/transaction_model_freezed/transaction_model.dart';
import 'package:waffy_clone/models/user_models_freezed/user_model.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/res/widgets/custom_button_widget.dart';
import 'package:waffy_clone/res/widgets/line_widget.dart';
import 'package:waffy_clone/res/widgets/main_button_widget.dart';
import 'package:waffy_clone/utils/general_utils.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view_model/transaction/transactions_view_model.dart';

class DetailsTransactionView extends HookWidget {
  final String? transactionId;
  const DetailsTransactionView({Key? key, this.transactionId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<TransactionModel?> transaction = useState(null);
    final ValueNotifier<UserModel?> user = useState(null);
    final date = useState('');
    final isLoading = useState(true);


    useEffect(() {
      handleFetchTransaction(transactionId!).then((data) {
        transaction.value = data;
        isLoading.value = false;
      });
    }, []);

    if(transaction.value != null){
      Utils.convertToArabicDate(transaction.value!.created_at).then((data) {
        date.value = data;
      });
      handleFetchUser(transaction.value!.uuid).then((data) {
        user.value = data;
      });
    }

    return Scaffold(
      body: SafeArea(
        child:
        isLoading.value ? Center(child: CircularProgressIndicator(),):
        SingleChildScrollView(
          child: Container(
            width: displayWidth(context),
            margin: EdgeInsets.only(left: displayWidth(context) * 0.05,right: displayWidth(context) * 0.05 , bottom: displayHeight(context) * 0.05),
            child: transaction.value != null ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: displayHeight(context) * 0.07,
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_rounded, color: AppColors.darkGreyColor),
                      ),
                    ),
                    SizedBox(height: displayHeight(context) * 0.01),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: AppColors.purpleColor,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.sell_rounded,
                                  color: AppColors.whiteColor,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text('شراء', style: AppStyle.instance.smallWhiteText)
                              ],
                            ),
                          ),
                          Text(
                            transaction.value!.name,
                            style: AppStyle.instance.h5Bold,
                          ),
                          Text(
                            'تاريخ: '
                            '${date.value}'
                            ' ● '
                            'رقم: '
                            '${transaction.value!.id.substring(0, 8)}#',
                            style: AppStyle.instance.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const LineWidget(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'حالة المعاملة',
                            style: AppStyle.instance.h5Bold,
                          ),
                          SizedBox(height: displayHeight(context) * 0.01,),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                  color: AppColors.greenColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check_circle_sharp,
                                  color: AppColors.whiteColor
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    transaction.value!.status == 'active' ? 'نشطة' : '',
                                    style: AppStyle.instance.h6Bold,
                                  ),
                                  Text(
                                    'يمكنك دفع قيمة الخدمة',
                                    style: AppStyle.instance.bodyMedium,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const LineWidget(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تفاصيل المنتج/الخدمة',
                            style: AppStyle.instance.h5Bold,
                          ),
                          SizedBox(height: displayHeight(context) * 0.01,),
                          Text(
                            transaction.value!.description,
                            style: AppStyle.instance.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const LineWidget(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تفاصيل البائع',
                            style: AppStyle.instance.h5Bold,
                          ),
                          SizedBox(height: displayHeight(context) * 0.01,),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 25,
                                backgroundColor: AppColors.lightGreyColor,
                                backgroundImage: AssetImage('assets/images/profileImage.png'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.value != null ? '${user.value!.fname} ${user.value!.lname}' : '',
                                    style: AppStyle.instance.textBold,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    user.value != null ? user.value!.phone.toString() : '',
                                    style: AppStyle.instance.bodyMedium,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const LineWidget(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'رسوم الدفع والتوصيل',
                            style: AppStyle.instance.h5Bold,
                          ),
                          SizedBox(height: displayHeight(context) * 0.01,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'التكلفة الرئيسية',
                                style: AppStyle.instance.bodyMedium,
                              ),
                              Text('${Utils.getTotalTransactionPrice(transaction.value!)} ريال', style: AppStyle.instance.bodyMedium)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'التوصيل',
                                style: AppStyle.instance.bodyMedium,
                              ),
                              Text('0 ريال', style: AppStyle.instance.bodyMedium)
                            ],
                          ),
                        ],
                      ),
                    ),
                    const LineWidget(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'الاجمالي',
                                style: AppStyle.instance.h6Bold,
                              ),
                              Row(
                                children: [
                                  Text(
                                      Utils.getTotalTransactionPrice(transaction.value!),
                                      style: AppStyle.instance.h6Bold
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text('ريال', style: AppStyle.instance.bodyMedium),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                MainButtonWidget(onPressed: () {
                  context.pop();
                }, text: "متابعة")
              ],
            ) :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('حدث خطأ', style: AppStyle.instance.errorMsg),
                SizedBox(height: displayHeight(context) * 0.04),
                CustomButtonWidget(
                    onPressed: () {
                      context.pop();
                    },
                    text: 'رجوع',
                    isSecondary: true
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
