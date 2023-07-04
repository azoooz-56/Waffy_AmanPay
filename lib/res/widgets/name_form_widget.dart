import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/res/widgets/custom_button_widget.dart';
import 'package:waffy_clone/utils/general_utils.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view_model/auth/user_creation_view_model.dart';

class NameFormWidget extends HookWidget {
  final ValueNotifier<int> pageNumber;
  NameFormWidget({Key? key, required this.pageNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isChecked = useState(false);
    ValueNotifier<String> error = useState('');
    final fnameController = useTextEditingController();
    final lnameController = useTextEditingController();
    final _formKey = useMemoized(() => GlobalKey<FormState>());

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "قم بإعداد حسابك في وفي",
                textAlign: TextAlign.center,
                style: AppStyle.instance.h4Bold,
              ),
              SizedBox(
                height: displayHeight(context)*0.02,
              ),
              Text(
                "من فضلك أدخل اسمك",
                textAlign: TextAlign.center,
                style: AppStyle.instance.bodyXLarge,
              ),
              SizedBox(
                height: displayHeight(context)*0.08,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const Center(
                      child: Icon(
                          Icons.account_circle_rounded,
                          size: 170,
                          color: AppColors.lightGreyColor
                      )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.only(right: 100),
                    child: IconButton(
                        splashColor: AppColors.blueColor,
                        iconSize: 35,
                        onPressed: () {
                          // TODO: Add way to get the image
                        },
                        icon: const Icon(
                            Icons.camera_alt_rounded,
                            color: AppColors.blueColor
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: displayHeight(context)*0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: displayWidth(context)*0.4,
                    child: TextFormField(
                      controller: fnameController,
                      validator: Utils.validateName,
                      decoration: const InputDecoration(
                        hintText: 'الاسم الاول',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: displayWidth(context)*0.4,
                    child: TextFormField(
                      controller: lnameController,
                      validator: Utils.validateName,
                      decoration: const InputDecoration(
                        hintText: 'الاسم الاخير',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: displayHeight(context)*0.02,
              ),
              Row(
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: isChecked,
                    builder: (BuildContext context, bool value, Widget? child) {
                      return Checkbox(
                        activeColor: AppColors.blueColor,
                        value: value,
                        onChanged: (bool? newValue) {
                          error.value = '';
                          isChecked.value = newValue ?? false;
                        },
                      );
                    },
                  ),
                  const Text('الموافقة على'),
                  GestureDetector(
                      onTap: () {
                        // TODO: Add link here
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text('الشروط والاحكام'),
                      )
                  )
                ],
              )
            ],
          ),
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
            if (_formKey.currentState!.validate()) {
              if(!isChecked.value){
                error.value = 'يجب الموافقة على الشروط والاحكام';
              }else{
                final res = await handleAddUsername(fnameController.text, lnameController.text);

                if(res.isEmpty){
                  pageNumber.value++;
                }else{
                  error.value = res;
                }
              }
            }
          },
          text: 'متابعة',
        )
      ],
    );
  }
}
