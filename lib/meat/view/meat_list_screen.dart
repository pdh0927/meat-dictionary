import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/dictionary_list.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DictionaryListScreen extends StatelessWidget {
  static String get routeName => 'meat_list';

  const DictionaryListScreen({
    super.key,
    required this.meatType,
  });

  final MeatType meatType;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: meatType.displayName,
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(PhosphorIcons.magnifyingGlass()),
            ),
          )
        ],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                alignment: Alignment.center,
                color: Colors.grey,
                child: const Text('배너'),
              ),
              DictionaryList(
                isFavoritesScreen: false,
                meatType: meatType,
              ),
            ],
          ),
        ));
  }
}
