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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6.0,
              vertical: 8.0,
            ),
            child: Icon(PhosphorIconsBold.arrowLeft, size: 24),
          ),
        ),
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
                width: double.infinity,
                height: 260,
                alignment: Alignment.center,
                color: Colors.grey,
                child: Image.asset(
                  "assets/imgs/common/tmp_pig_list.png",
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
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
