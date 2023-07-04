import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:waffy_clone/models/transaction_model_freezed/transaction_model.dart';
import 'package:waffy_clone/models/user_models_freezed/user_model.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/utils/general_utils.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view_model/transaction/transactions_view_model.dart';


class CardTransactionWidget extends HookWidget {
  final TransactionModel transaction;
  const CardTransactionWidget({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = useState('');
    final ValueNotifier<UserModel?> user = useState(null);

    useEffect(() {
      Utils.convertToArabicDate(transaction.created_at).then((data) {
        date.value = data;
      });
      handleFetchUser(transaction.uuid).then((data) {
        user.value = data;
      });
    }, []);

    return InkWell(
      onTap: (){
        context.go("/home/details_transaction/${transaction.id}");
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            border: Border.all(color: AppColors.lightGreyColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(color: AppColors.lightGreenColor, borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          CupertinoIcons.check_mark_circled_solid,
                          color: AppColors.greenColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          transaction.status == 'active' ? 'نشطة' : '',
                          style: AppStyle.instance.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  Text(
                    user.value != null ? '${user.value!.fname} ${user.value!.lname}' : '',
                    style: AppStyle.instance.h6Bold,
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        'بيع  ●  ',
                        style: AppStyle.instance.bodyMedium,
                      ),
                      Text(date.value),
                    ],
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/pending.png',
                            width: displayWidth(context) * 0.15,
                          ),
                          Text(
                            transaction.transaction_status == 'pending' ? 'بإنتظار مشتري' : '',
                            style: AppStyle.instance.bodyXLarge,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'المبلغ المطلوب',
                            style: AppStyle.instance.bodyMedium,
                          ),
                          Row(
                            children: [
                              Text(
                                Utils.getTotalTransactionPrice(transaction),
                                style: AppStyle.instance.h6Bold,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'ريال',
                                style: AppStyle.instance.bodyMedium,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: displayWidth(context) * 0.05,
              color: AppColors.greyColor,
            )
          ],
        ),
      ),
    );
  }
}
