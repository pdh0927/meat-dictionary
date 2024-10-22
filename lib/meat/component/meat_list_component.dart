import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/utils/data_utils.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

// meat list 각 항목 컴포넌트
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
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          // 이미지
          FutureBuilder<String>(
            future: DataUtils.convertGsToDownloadUrl(meatModel.imgPath),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 로딩 중일 때 Shimmer 표시
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20.w,
                    width: 20.w,
                    color: Colors.grey[300],
                  ),
                );
              } else if (snapshot.hasError || !snapshot.hasData) {
                // 오류 발생 시 아이콘 표시
                return const Icon(Icons.error, color: Colors.red, size: 50);
              } else {
                // 성공 시 CachedNetworkImage 사용
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: snapshot.data!,
                    fit: BoxFit.fill,
                    height: 20.w,
                    width: 20.w,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 20.w,
                        width: 20.w,
                        color: Colors.grey[300],
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 50,
                    ),
                  ),
                );
              }
            },
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // 고기 이름
                    Text(
                      meatModel.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: BLACK_COLOR,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const Spacer(),

                    // 즐겨찾기 버튼
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

                // 고기 설명
                Text(
                  meatModel.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8E8E8E),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 9),

                // 세부 지표
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

// 지표 라벨
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
          // 라벨명
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: BLACK_COLOR,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(width: 3),

          // 수치
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
