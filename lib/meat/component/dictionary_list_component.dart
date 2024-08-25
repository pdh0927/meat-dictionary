import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class DictionaryListComponent extends ConsumerWidget {
  final MeatModel meatModel;
  final bool isSelected;

  const DictionaryListComponent({
    super.key,
    required this.meatModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
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
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    meatModel.name,
                    style: const TextStyle(
                      fontSize: 20,
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
                          ? PhosphorIconsFill.star
                          : PhosphorIcons.star(),
                      color: isSelected ? const Color(0XFFFF0000) : GREY_COLOR,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                meatModel.usage.map((usage) => usage.label).join(', '),
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF636366),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  _OvalLabel(
                    label: '식감',
                    value: meatModel.texture.label,
                  ),
                  const SizedBox(width: 4),
                  _OvalLabel(
                    label: '고소함',
                    value: meatModel.savoryFlavor.label,
                  ),
                  const SizedBox(width: 4),
                  _OvalLabel(
                    label: '육향',
                    value: meatModel.meatAroma.label,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
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
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
          const SizedBox(width: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF007BFE),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
