
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:waffy_clone/models/dropdown_option_model.dart';
import 'package:waffy_clone/models/user_models_freezed/user_model.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/res/style/text_style.dart';
import 'package:waffy_clone/res/widgets/dropdown_option_widget.dart';
import 'package:waffy_clone/utils/general_utils.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view_model/profile/profile_view_model.dart';

class ProfileView extends HookWidget {
  ProfileView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final ValueNotifier<UserModel?> user = useState(null);
    useEffect(() {
      handleFetchCurrentUser().then((data) {
        user.value = data;
      });
    }, []);

    List<DropdownOption> dropdownList = [
      DropdownOption(
          title: 'إعدادات الحساب',
          options: [
            RowOption(text: 'البيانات الشخصية', icon: Icons.person_outline_rounded, onTap: () {}),
            RowOption(text: 'تفاصيل الحساب البنكي', icon: Icons.credit_card_rounded, onTap: () {})
          ]
      ),
      DropdownOption(
          title: 'تطبيق وفي',
          options: [
            RowOption(text: 'الدعم والمساعدة', icon: Icons.support_agent_rounded, onTap: () {}),
            RowOption(text: 'سياسة الخصوصية', icon: Icons.file_copy_outlined, onTap: () {}),
            RowOption(text: 'الشروط والأحكام', icon: Icons.file_copy_outlined, onTap: () {}),
            RowOption(text: 'حذف ملفك الشخصي', icon: Icons.delete_outline_rounded, onTap: () {})
          ]
      ),
      DropdownOption(
          title: '',
          options: [
            RowOption(
                text: 'تسيجل الخروج',
                icon: Icons.logout_rounded,
                iconColor: AppColors.redColor,
                onTap: () {
                  handleSignOut();
                  context.go("/auth");
                }
            )
          ]
      ),
    ];
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(
              displayWidth(context) * 0.05,
              0,
              displayWidth(context) * 0.05,
              displayHeight(context) * 0.06
          ),
          child: Column(
            children: [
              SizedBox(height: displayHeight(context) * 0.02),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.04,
                    vertical: displayHeight(context)* 0.01
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.lightGreyColor,
                      offset: Offset(0, 2),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.account_circle_rounded,
                      size: 100,
                      color: AppColors.lightGreyColor,
                    ),
                    SizedBox(width: displayWidth(context) * 0.03),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              user.value != null ? Utils.getUserFullname(user.value!) : '-',
                              style: AppStyle.instance.textBold,
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.check_circle_rounded,
                              size: 20,
                              color: AppColors.blueColor,
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          user.value != null ? user.value!.phone.toString() : '-',
                          style: AppStyle.instance.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 20,
                              color: AppColors.goldColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              user.value != null ? user.value!.rate.toString() : '0',
                              style: AppStyle.instance.grayTextBold,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ),
              SizedBox(height: displayHeight(context) * 0.01),
              DropdownOptionWidget(
                dropdownOptions: dropdownList[0],
                hasUnderline: true
              ),
              DropdownOptionWidget(
                dropdownOptions: dropdownList[1],
                hasUnderline: true
              ),
              DropdownOptionWidget(
                dropdownOptions: dropdownList[2],
                hasUnderline: false
              )
            ],
          ),
        ),
      ),
    );
  }
}
