import 'package:flutter/material.dart';
import 'package:meat_dictionary/meat/component/dictionary.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
return const Column(children: [Dictionary()],);
  }
}