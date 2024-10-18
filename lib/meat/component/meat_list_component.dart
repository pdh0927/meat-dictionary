import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class MeatListComponent extends ConsumerWidget {
  final MeatModel meatModel;
  final bool isSelected;
  final double? score;

  const MeatListComponent({
    super.key,
    required this.meatModel,
    required this.isSelected,
    this.score,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              meatModel.imgPath,
              height: 20.w,
              width: 20.w,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      meatModel.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: BLACK_COLOR,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        await ref
                            .read(favoritesProvider.notifier)
                            .toggleFavorite(meatModel.type, meatModel.id);
                      },
                      child: Icon(
                        isSelected
                            ? PhosphorIconsFill.heart
                            : PhosphorIcons.heart(),
                        color:
                            isSelected ? const Color(0XFFFF0000) : GREY_COLOR,
                        size: 23.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  meatModel.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8E8E8E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    _OvalLabel(
                      label: '식감',
                      value: meatModel.texture.label,
                    ),
                    const SizedBox(width: 8),
                    _OvalLabel(
                      label: '고소함',
                      value: meatModel.savoryFlavor.label,
                    ),
                    const SizedBox(width: 8),
                    _OvalLabel(
                      label: '육향',
                      value: meatModel.meatAroma.label,
                    ),
                    if (score != null) Text(score!.round().toString())
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OvalLabel extends StatelessWidget {
  final String label;
  final String value;

  const _OvalLabel({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0XFFF4F6FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: BLACK_COLOR,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 3),
          Text(
            value,
            style: const TextStyle(
              fontSize: 11,
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
