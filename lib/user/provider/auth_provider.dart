import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meat_dictionary/common/view/root_tab.dart';
import 'package:meat_dictionary/common/view/splash_screen.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/view/detail/pork/galmaegisal_detail_screen.dart';
import 'package:meat_dictionary/meat/view/detail/pork/hangjeongsal_detail_screen.dart';
import 'package:meat_dictionary/meat/view/detail/pork/mocksal_detail_screen.dart';
import 'package:meat_dictionary/meat/view/detail/pork/samgyeobsal_detail_screen.dart';
import 'package:meat_dictionary/meat/view/favorites_screen.dart';
import 'package:meat_dictionary/meat/view/filter_screen.dart';
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
          path: '/meat_list',
          name: MeatListScreen.routeName,
          builder: (context, state) {
            final meatType = state.extra as MeatType;
            return MeatListScreen(meatType: meatType);
          },
        ),
        GoRoute(
          path: '/favorites',
          name: FavoritesScreen.routeName,
          builder: (_, __) => const FavoritesScreen(),
        ),
        GoRoute(
          path: '/mocksal_detail',
          name: MocksalDetailScreen.routeName,
          builder: (context, state) {
            final Map<String, dynamic> extra =
                state.extra as Map<String, dynamic>;

            final meatModel = extra['meatModel'] as MeatModel;

            return MocksalDetailScreen(meatModel: meatModel);
          },
        ),
        GoRoute(
          path: '/samgyeobsal_detail',
          name: SamgyeobsalDetailScreen.routeName,
          builder: (context, state) {
            final Map<String, dynamic> extra =
                state.extra as Map<String, dynamic>;

            final meatModel = extra['meatModel'] as MeatModel;

            return SamgyeobsalDetailScreen(meatModel: meatModel);
          },
        ),
        GoRoute(
          path: '/galmaegisal_detail',
          name: GalmaegisalDetailScreen.routeName,
          builder: (context, state) {
            final Map<String, dynamic> extra =
                state.extra as Map<String, dynamic>;

            final meatModel = extra['meatModel'] as MeatModel;

            return GalmaegisalDetailScreen(meatModel: meatModel);
          },
        ),
        GoRoute(
          path: '/hangjeongsal_detail',
          name: HangjeongsalDetailScreen.routeName,
          builder: (context, state) {
            final Map<String, dynamic> extra =
                state.extra as Map<String, dynamic>;

            final meatModel = extra['meatModel'] as MeatModel;

            return HangjeongsalDetailScreen(meatModel: meatModel);
          },
        ),
        GoRoute(
          path: '/filter',
          name: FilterScreen.routeName,
          builder: (_, __) => const FilterScreen(),
        ),
      ];
}
