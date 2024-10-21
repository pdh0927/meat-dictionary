import 'package:flutter/widgets.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/view/detail/pork/apdalisal_detail_screen.dart';
import 'package:meat_dictionary/meat/view/detail/pork/galmaegisal_detail_screen.dart';
import 'package:meat_dictionary/meat/view/detail/pork/hangjeongsal_detail_screen.dart';
import 'package:meat_dictionary/meat/view/detail/pork/mocksal_detail_screen.dart';
import 'package:meat_dictionary/meat/view/detail/pork/samgyeobsal_detail_screen.dart';
import 'package:meat_dictionary/meat/view/meat_detail_screen.dart';

Widget getMeatDetailScreen(MeatModel meat) {
  // 고기의 타입과 이름에 따라 해당 화면을 반환
  if (meat.type == MeatType.pork) {
    switch (meat.name) {
      case '목살':
        return MocksalDetailScreen(meatModel: meat);
      case '삼겹살':
        return SamgyeobsalDetailScreen(meatModel: meat);
      case '갈매기살':
        return GalmaegisalDetailScreen(meatModel: meat);
      case '항정살':
        return HangjeongsalDetailScreen(meatModel: meat);
      case '앞다리살':
        return ApdalisalDetailScreen(meatModel: meat);
      default:
        return const MeatDetailScreen(); // 기본 상세 화면
    }
  }
  return const MeatDetailScreen(); // 고기 타입이 일치하지 않을 경우 기본 화면
}
