import 'package:flutter/material.dart';
import 'package:meat_dictionary/meat/component/dictionary.dart';

class HomeScreen extends StatelessWidget {

  static String get routeName => 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [Dictionary()],);
  }
}