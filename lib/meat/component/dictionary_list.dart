import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DictionaryList extends StatelessWidget {
  const DictionaryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed("meat_detail");
              },
              child: Text('Button ${index + 1}'),
            ),
          );
        },
      );
  }
}