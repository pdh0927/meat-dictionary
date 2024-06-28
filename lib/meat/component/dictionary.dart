import 'package:flutter/material.dart';
import 'package:meat_dictionary/meat/component/dictionary_list.dart';

class Dictionary extends StatelessWidget {
  const Dictionary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 500,
          child: DictionaryList(),
        ),
      ],
    );
  }
}
