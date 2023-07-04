import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waffy_clone/models/transaction_model_freezed/transaction_model.dart';
import 'package:waffy_clone/res/color.dart';
import 'package:waffy_clone/utils/sizes_helpers.dart';
import 'package:waffy_clone/view/home/home_view.dart';
import 'package:waffy_clone/view/profile/profile_view.dart';
import 'package:waffy_clone/view_model/home/home_view_model.dart';

class NavBarViews extends HookConsumerWidget {
  final List<Widget> screens = [
    HomeView(),
    const Text("HI"),
    HomeView(),
    const Text("HI"),
    ProfileView(),
  ];

  final List<String> titles = ['الرئيسية', 'معاملاتي', '', 'محفظتي', 'ملفي'];

  @override
  Widget build(BuildContext context, ref) {
    final currentIndex = useState(0);

    void onTabSelected(int index) {
      currentIndex.value = index;
    }

    BoxDecoration getPageDecoration(int pageNum) {
      if (pageNum == 0) {
        return const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.blueOpacityColor, AppColors.whiteColor]));
      } else if (pageNum == 4) {
        return const BoxDecoration(color: AppColors.grayBackground);
      } else {
        return const BoxDecoration(color: AppColors.whiteColor);
      }
    }

    return Scaffold(
      body: Container(
        width: displayWidth(context),
        height: displayHeight(context),
        decoration: getPageDecoration(currentIndex.value),
        child: screens[currentIndex.value],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Set the shadow color
              blurRadius: 8, // Set the blur radius
              offset: const Offset(0, -2), // Set the offset
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex.value,
          onTap: (index) {
            if (index == 0) {
              ref.refresh(transactionProvider);
              onTabSelected(index);

            } else {
              onTabSelected(index);
            }
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.arrow_right_arrow_left),
              label: 'معاملاتي',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: 'محفظتي',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'ملفي',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blueColor,
        child: const Icon(Icons.add),
        onPressed: () {
          context.go("/home/create_transaction");
          // Add your custom action here
        },
      ),
    );
  }
}