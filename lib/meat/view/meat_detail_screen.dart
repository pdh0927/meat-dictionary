import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';

class MeatDetailScreen extends StatelessWidget {

  static String get routeName => 'meat_detail';

  const MeatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(child: Center(child: Text("Meat Detail Screen"),)) ;
  }
}