import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/res/widgets/main_button_widget.dart';
import 'package:waffy_clone/utils/general_utils.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view_model/home/home_view_model.dart';
import 'package:waffy_clone/view_model/transaction/transactions_view_model.dart';

class CreateTransactionView extends HookConsumerWidget {
  const CreateTransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final nameProductController = useTextEditingController();
    final priceProductController = useTextEditingController();
    final desProductController = useTextEditingController();
    final emailProductController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final price = double.tryParse(priceProductController.text);
    final totalValue = useState<double>(0.0);
    final isLoading = useState(false);

    void updateTotal(String value) {
      final price = double.tryParse(value) ?? 0.0;
      totalValue.value = (price * 0.04) + price; // Example calculation for the total value
    }

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.close))
      ]),
      body: isLoading.value ? Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'أضف صورة المنتج/الخدمة',
                style: AppStyle.instance.h5Bold,
              ),
              SizedBox(
                height: displayHeight(context) * 0.02,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nameProductController,
                      decoration: const InputDecoration(
                        hintText: "اسم المنتج/الخدمة",
                      ),
                      validator: Utils.validateEmpty,
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                    ),
                    TextFormField(
                      controller: desProductController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 7,
                      decoration: const InputDecoration(
                        hintText: "وصف المنتج/الخدمة",
                      ),
                      validator: Utils.validateEmpty,
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.05,
                    ),
                    Text(
                      "ماهو سعر المنتج/الخدمة؟",
                      style: AppStyle.instance.h5Bold,
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                    ),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        TextFormField(
                          controller: priceProductController,
                          decoration: const InputDecoration(
                            hintText: "اكتب السعر هنا",
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: updateTotal,
                          validator: Utils.validateEmpty,
                        ),
                        const Visibility(
                          visible: true, // Set to true to always show the suffix text
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "ريال",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.01,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: price == null
                          ? Container()
                          : Text(
                              'رسوم الخدمة ${totalValue.value} ريال',
                              style: AppStyle.instance.bodyMedium,
                            ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.01,
                    ),
                    TextFormField(
                      controller: emailProductController,
                      decoration: const InputDecoration(
                        hintText: "البريد الالكتروني للمشتري",
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: Utils.validateEmail,
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.1,
                    ),
                    MainButtonWidget(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {

                          isLoading.value = true;

                          await handleCreateTransaction(
                              nameProductController.text,
                              desProductController.text,
                              price,
                              price! * 0.04,
                              emailProductController.text
                          );
                          isLoading.value = false;

                          ref.refresh(transactionProvider);

                          context.go("/home/create_transaction/finish_transaction");
                        }
                      },
                      text: 'متابعة'
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
