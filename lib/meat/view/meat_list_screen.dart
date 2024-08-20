import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';

class MeatListScreen extends StatelessWidget {
  static String get routeName => 'meat_list';

  const MeatListScreen({
    super.key,
    required this.meatType,
  });

  final String meatType;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: meatType,
        child: Column(
          children: [],
        ));
  }
}
