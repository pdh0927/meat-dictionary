import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meat_dictionary/common/view/root_tab.dart';
import 'package:meat_dictionary/common/view/splash_screen.dart';
import 'package:meat_dictionary/meat/view/meat_detail_screen.dart';
import 'package:meat_dictionary/meat/view/meat_list_screen.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider();
});

class AuthProvider extends ChangeNotifier {
  List<GoRoute> get routes => [
        GoRoute(
          path: '/',
          name: RootTab.routeName,
          builder: (_, __) => const RootTab(),
        ),
        GoRoute(
          path: '/splash',
          name: SplashScreen.routeName,
          builder: (_, __) => const SplashScreen(),
        ),
        GoRoute(
          path: '/meat_detail',
          name: MeatDetailScreen.routeName,
          builder: (_, __) => const MeatDetailScreen(),
        ),
        GoRoute(
          path: '/meat_list', // Define the route without parameters
          name: MeatListScreen.routeName,
          builder: (context, state) {
            final meatType =
                state.extra as String; // Extract the meatType from extra
            return MeatListScreen(meatType: meatType);
          },
        ),
      ];
}
