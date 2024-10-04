import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meat_dictionary/common/const/colors.dart';
import 'package:meat_dictionary/common/const/text_style.dart';
import 'package:meat_dictionary/common/layout/default_layout.dart';
import 'package:meat_dictionary/meat/component/detail/fresh_pork_choosing_tips.dart';
import 'package:meat_dictionary/meat/component/detail/meat_profile.dart';
import 'package:meat_dictionary/meat/const/data.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/provider/favorites_provider.dart';
import 'package:meat_dictionary/meat/view/detail/pork/mocksal_detail_screeN.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

// 공통 고기 detail 내용
class CommonMeatDetailFrame extends ConsumerWidget {
  const CommonMeatDetailFrame({
    super.key,
    required this.meatModel,
    required this.topChild,
    required this.bottomChild,
  });

  final MeatModel meatModel;
  final Widget topChild;
  final Widget bottomChild;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref
        .watch(favoritesProvider.notifier)
        .isFavorite(meatModel.type, meatModel.id);

    return DefaultLayout(
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 6.0,
            vertical: 8.0,
          ),
          child: Icon(PhosphorIconsBold.caretLeft, size: 24),
        ),
      ),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 공유하기 버튼
            InkWell(
              onTap: () {
                // 공유하기 버튼 눌렀을 때의 동작 여기에 추가
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 8.0,
                ),
                child: Icon(PhosphorIcons.share(), size: 24),
              ),
            ),
            // 즐겨찾기 버튼
            InkWell(
              onTap: () async {
                await ref.read(favoritesProvider.notifier).toggleFavorite(
                      meatModel.type,
                      meatModel.id,
                    );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 8.0,
                ),
                child: Icon(
                  isSelected ? PhosphorIconsFill.star : PhosphorIcons.star(),
                  color: isSelected ? const Color(0XFFFF0000) : BLACK_COLOR,
                  size: 24.0,
                ),
              ),
            ),
            const SizedBox(width: 10)
          ],
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            MeatProfile(
              meatModel: meatModel,
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  topChild,
                  const Divider(
                    height: 48,
                    thickness: 1.0,
                    color: Color(0xFFD8D8D8),
                  ),
                  // 풍미 그래프
                  _MeatAttributes(meatModel: meatModel),
                  const Divider(
                    height: 48.0,
                    thickness: 1.0,
                    color: Color(0xFFD8D8D8),
                  ),
                ],
              ),
            ),
            // 신선한 고기 고르는 방법
            meatModel.type == MeatType.pork
                ? const FreshPorkChoosingTips()
                : const FreshPorkChoosingTips(),
            const Divider(
              height: 48.0,
              thickness: 1.0,
              color: Color(0xFFD8D8D8),
            ),
            bottomChild,
            // 베너
            const _Banner(),
            const Divider(
              color: Color(0xFFF4F6FA),
              height: 0,
              thickness: 15.0,
            ),

            // 다른 고기 추천
            _Recommend(
              thisPageId: meatModel.id,
              meatType: meatModel.type,
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}

// 풍미 그래프
class _MeatAttributes extends StatelessWidget {
  const _MeatAttributes({required this.meatModel});

  final MeatModel meatModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '풍미 ',
                style: detailBoldContentStyle,
              ),
              TextSpan(text: '그래프', style: detailThinContentStyle),
            ],
          ),
        ),
        const SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 식감 수치
            _VerticalBar(
              title: '식감',
              label: meatModel.texture.label,
              value: meatModel.texture.sliderValue / 0.8,
            ),
            const SizedBox(width: 50),
            // 지방 수치
            _VerticalBar(
              title: '지방',
              label: meatModel.savoryFlavor.label,
              value: meatModel.savoryFlavor.sliderValue / 0.8,
            ),
            const SizedBox(width: 50),
            // 육향 수치
            _VerticalBar(
              title: '육향',
              label: meatModel.meatAroma.label,
              value: meatModel.meatAroma.sliderValue / 0.8,
            ),
          ],
        ),
      ],
    );
  }
}

// 수직 막대 그래프
class _VerticalBar extends StatelessWidget {
  const _VerticalBar({
    required this.title,
    required this.label,
    required this.value,
  });

  final String title;
  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // 막대 그래프
        Stack(
          children: [
            Container(
              width: 10,
              height: 80,
              color: const Color(0xFFD9D9D9), // 배경색
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 10,
                height: 80 * value,
                color: PRIMARY_COLOR, // 막대 색상
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // 속성명
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        // 속성 값 라벨
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

// 배너
class _Banner extends StatelessWidget {
  const _Banner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.green,
      child: const Center(
        child: Text('배너'),
      ),
    );
  }
}

// 다른 고기 추천
class _Recommend extends StatelessWidget {
  const _Recommend({
    required this.meatType,
    required this.thisPageId,
  });

  final MeatType meatType;
  final int thisPageId;

  @override
  Widget build(BuildContext context) {
    final List<MeatModel> selectedList = List.from(
      meatType == MeatType.pork ? porkList : beefList,
    );

    // 현재 페이지에 해당하는 고기 제외
    selectedList.removeWhere((meat) => meat.id == thisPageId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('추천', style: detailTitleStyle),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 30.w + 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: selectedList.length,
            itemBuilder: (context, index) {
              final meatModel = selectedList[index];

              return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 16.0 : 8.0, // 첫번째 항목만 왼쪽 패딩 추가
                    right: 8.0,
                  ),
                  child: _RecommendCard(meatModel: meatModel));
            },
          ),
        ),
      ],
    );
  }
}

// 추천 카드
class _RecommendCard extends ConsumerWidget {
  const _RecommendCard({required this.meatModel});

  final MeatModel meatModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMap = ref.watch(favoritesProvider);
    final favoriteIds = favoriteMap[meatModel.type] ?? {};
    final isFavorite = favoriteIds.contains(meatModel.id);

    final Map<String, String> meatDetailRoutes = {
      '목살': MocksalDetailScreen.routeName,
    };

    return InkWell(
      onTap: () {
        final routeName = meatDetailRoutes[meatModel.name];
        if (routeName != null) {
          context.pushNamed(
            routeName,
            extra: {'meatModel': meatModel},
          );
        } else {
          context.pushNamed("meat_detail");
        }
      },
      child: SizedBox(
        width: 30.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 고기 사진
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                meatModel.imgPath,
                height: 30.w,
                width: 30.w,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 고기 이름
                Text(
                  meatModel.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // 즐겨찾기 버튼
                InkWell(
                  onTap: () async {
                    await ref
                        .read(favoritesProvider.notifier)
                        .toggleFavorite(meatModel.type, meatModel.id);
                  },
                  child: Icon(
                    isFavorite ? PhosphorIconsFill.star : PhosphorIcons.star(),
                    color: isFavorite ? const Color(0XFFFF0000) : GREY_COLOR,
                    size: 18.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            // 고기 설명
            Text(
              meatModel.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 9.0,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
