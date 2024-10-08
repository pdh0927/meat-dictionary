import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetailMenuBar extends StatelessWidget {
  const DetailMenuBar({
    super.key,
    required this.names,
    required this.offsets,
    required this.onMenuSelected,
  });

  final List<String> names;
  final List<double> offsets;
  final Function(double) onMenuSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(names.length, (index) {
        return _MenuButton(
          width: 100.w / names.length,
          name: names[index],
          onTap: () => onMenuSelected(offsets[index]),
        );
      }),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    required this.width,
    required this.name,
    required this.onTap,
  });

  final double width;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: width,
        color: Colors.black,
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
