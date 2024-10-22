import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/utils/data_utils.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

// 고기 프로필
class MeatProfile extends StatelessWidget {
  const MeatProfile({
    super.key,
    required this.meatModel,
  });

  final MeatModel meatModel;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                height: 50.w,
                width: 100.w,
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
                height: 50.w,
                width: 100.w,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 50.w,
                    width: 100.w,
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

      const SizedBox(height: 20.0),

      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 고기 이름
              Text(
                meatModel.name,
                style: const TextStyle(
                  color: BLACK_COLOR,
                  fontFamily: "Pretend",
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3.0),
              // 고기 한마디
              Text(
                meatModel.description,
                style: const TextStyle(
                  color: Color(0xFF8E8E8E),
                  fontFamily: "Pretend",
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 8.0),

              const SizedBox(
                width: 56,
                child: Divider(
                  color: Color(0xFFD8D8D8),
                  thickness: 1,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
