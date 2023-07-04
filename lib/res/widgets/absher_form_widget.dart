import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/res/widgets/custom_button_widget.dart';
import 'package:waffy_clone/utils/general_utils.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view_model/auth/user_creation_view_model.dart';

class AbsherFormWidget extends HookWidget {
  final ValueNotifier<int> pageNumber;
  AbsherFormWidget({Key? key, required this.pageNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pidController = useTextEditingController();
    ValueNotifier<String> error = useState('');
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    final isLoading = useState(false);

    return isLoading.value ? Container(height: displayHeight(context),child: Center(child: CircularProgressIndicator(),)) :Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "أكد هويتك الشخصية",
                textAlign: TextAlign.center,
                style: AppStyle.instance.h4Bold,
              ),
              SizedBox(
                height: displayHeight(context)*0.02,
              ),
              Text(
                "حتى تتمكن من انشاء معاملة واستخدام التطبيق",
                textAlign: TextAlign.center,
                style: AppStyle.instance.bodyXLarge,
              ),
              SizedBox(
                height: displayHeight(context)*0.08,
              ),
              Image.asset(
                'assets/images/absher.png',
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: displayHeight(context)*0.04,
              ),
              TextFormField(
                controller: pidController,
                validator: Utils.validateAbsherNumber,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  hintText: 'ادخل الرقم القومي او رقم الاقامة',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: displayHeight(context)*0.02,
        ),
        Text(
          error.value.toString(),
          style: AppStyle.instance.errorMsg,
        ),
        SizedBox(
          height: displayHeight(context)*0.06,
        ),
        CustomButtonWidget(
            onPressed: () async {
              error.value = '';
              if (_formKey.currentState!.validate()) {
                isLoading.value = true;
                final res = await handleAddAbsher(pidController.text);
                isLoading.value = false;

                if(res.isEmpty){
                  context.go('/home');
                }else{
                  error.value = res;
                }
              }
            },
            text: 'متابعة'
        ),
        SizedBox(
          height: displayHeight(context)*0.02,
        ),
        CustomButtonWidget(
          onPressed: () {
            context.replace('/home');
          },
          text: 'تخطي وقم بتأكيد الهوية لاحقا',
          isSecondary: true,
        ),
      ],
    );
  }
}
