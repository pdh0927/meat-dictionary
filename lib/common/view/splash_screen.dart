import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/common/view/root_tab.dart';

// 스플래쉬 스크린
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static String get routeName => 'splash';

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RootTab(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/common/cow_home.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(color: Colors.white)
          ],
        ),
      ),
    );
  }
}
