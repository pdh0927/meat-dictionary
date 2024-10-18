import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:meat_dictionary/meat/component/detail/horizozntal_images.dart';
import 'package:meat_dictionary/meat/component/detail/small_title_components.dart';

class FreshPorkChoosingTips extends StatefulWidget {
  const FreshPorkChoosingTips({super.key});

  @override
  State<FreshPorkChoosingTips> createState() => _FreshPorkChoosingTipsState();
}

class _FreshPorkChoosingTipsState extends State<FreshPorkChoosingTips> {
  final List<String> gssGoodImageurls = const [
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/1.jpg',
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/2.jpg',
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/2.jpg',
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/1.jpg',
  ];

  List<String> goodImageUrls = [];

  final List<String> gsBadImageurls = const [
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/1.jpg',
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/1.jpg',
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/2.jpg',
    'gs://meat-dictionary.appspot.com/meat-detail/galmaegisal/good/2.jpg',
  ];
  List<String> badImageUrls = [];

  final List<String> titles = const [
    '흐물하지 않고 탄력 있는 것',
    '고기색이 분홍색을 띠는 것',
    '지방이 희고 단단한 것',
    '겉에 핏물이 없는 것',
  ];

  final List<String> highlights = const ['탄력', '분홍', '희고 단단', '핏물'];

  final List<String> descriptions = const [
    '탄력이 있을수록 신선해요.',
    '색이 희미하면 신선하지 않아요.',
    '지방이 누런건 오래된 고기예요.',
    '핏물이 나오지 않았을수록 신선해요.',
  ];

  Future<void> fetchDownloadUrls() async {
    List<String> goodUrls = await Future.wait(
      gssGoodImageurls.map((path) => convertGsToDownloadUrl(path)).toList(),
    );

    List<String> badUrls = await Future.wait(
      gsBadImageurls.map((path) => convertGsToDownloadUrl(path)).toList(),
    );

    setState(() {
      goodImageUrls = goodUrls;
      badImageUrls = badUrls;
    });
  }

  Future<String> convertGsToDownloadUrl(String gsPath) async {
    try {
      final ref = FirebaseStorage.instance.refFromURL(gsPath);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error fetching download URL: $e');
      return '';
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDownloadUrls();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ChoosingFreshMeat()),
          const SizedBox(height: 16.0),
          HorizontalImages(
            titles: titles,
            highlights: highlights,
            descriptions: descriptions,
            goodImageUrls: goodImageUrls,
            badImageUrls: badImageUrls,
            goodDescriptionsList: const [
              ['근육이 많이 갈라진 것', '하나의 근육이 아닌 것'],
              ['흰색 근내 지방이 많은 것', '살코기가 안 많은 것'],
              ['흰색 근내 지방이 많은 것', '살코기가 안 많은 것'],
              ['흰색 근내 지방이 많은 것', '살코기가 안 많은 것'],
            ],
            badDescriptionsList: const [
              ['근육이 많이 갈라진 것', '하나의 근육이 아닌 것'],
              ['흰색 근내 지방이 많은 것', '살코기가 안 많은 것'],
              ['흰색 근내 지방이 많은 것', '살코기가 안 많은 것'],
              ['흰색 근내 지방이 많은 것', '살코기가 안 많은 것'],
            ],
          )
        ],
      ),
    );
  }
}
