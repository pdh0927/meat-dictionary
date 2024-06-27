import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meat_dictionary/meat/component/dictionary_list_component.dart';
import 'package:meat_dictionary/meat/const/data.dart';

class DictionaryList extends StatelessWidget {
  const DictionaryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        itemCount: porkList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              onTap: () {
                context.pushNamed("meat_detail");
              },
              child: DictionaryListComponent(
                meatModel: porkList[index],
                isSelected: false,
              ),
            ),
          );
        },
      ),
    );
  }
}
