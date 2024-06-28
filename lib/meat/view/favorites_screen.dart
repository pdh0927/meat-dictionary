import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/dictionary_list.dart';
import 'package:meat_dictionary/meat/component/meat_menu.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  String selectedType = 'pork'; // 기본값을 돼지로 설정

  void _onTypeChanged(String type) {
    setState(() {
      selectedType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text('즐겨찾기', style: screenTitleStyle),
              const SizedBox(height: 12.0),
              MeatMenu(
                selectedType: selectedType,
                onTypeChanged: _onTypeChanged,
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: DictionaryList(
                  isFavoritesScreen: true,
                  type: selectedType,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
