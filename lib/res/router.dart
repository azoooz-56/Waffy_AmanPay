import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waffy_clone/view/auth/auth_view.dart';
import 'package:waffy_clone/view/auth/lock_wrapper_view.dart';
import 'package:waffy_clone/view/auth/onBoarding_view.dart';
import 'package:waffy_clone/view/home/finish_transaction_view.dart';
import 'package:waffy_clone/view/home/nav_bar_view.dart';
import 'package:waffy_clone/view/transaction/create_transaction_view.dart';
import 'package:waffy_clone/view/auth/splash_view.dart';
import 'package:waffy_clone/view/transaction/detail_transaction_view.dart';

final GoRouteProvider = Provider((ref) => GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
      routes: <GoRoute>[
        GoRoute(
          path: 'onBoarding',
          builder: (context, state) {
            return  OnBoardingView();
          },
        ),
        GoRoute(
          path: 'auth',
          builder: (context, state) {
            return const AuthView();
          },
        ),
        GoRoute(
          path: 'lock',
          builder: (context, state) {
            return const LockWrapperView();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (context, state) => NavBarViews(),
            routes: <GoRoute>[
              GoRoute(
                  path: 'create_transaction',
                  builder: (context, state) => const CreateTransactionView(),
                  routes: <GoRoute>[
                    GoRoute(
                        path: 'finish_transaction',
                        builder: (context, state) => const FinishTransactionView(),
                    )
                  ]
              ),
              GoRoute(
                  path: 'details_transaction/:transactionId',
                  builder: (context, state) {
                    final transactionId = state.pathParameters['transactionId'];
                    return DetailsTransactionView(transactionId: transactionId);
                  },
              )
            ]
        )
      ],
    ),

  ],
));


