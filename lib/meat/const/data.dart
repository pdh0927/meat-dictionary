import 'package:meat_dictionary/meat/model/meat_identifier.dart';
import 'package:meat_dictionary/meat/model/meat_model.dart';
import 'package:meat_dictionary/meat/view/detail/pork/galmaegisal_detail_screen.dart';
import 'package:meat_dictionary/meat/view/detail/pork/hangjeongsal_detail_screen.dart';
import 'package:meat_dictionary/meat/view/detail/pork/mocksal_detail_screen.dart';
import 'package:meat_dictionary/meat/view/detail/pork/samgyeobsal_detail_screen.dart';

Map<MeatIdentifier, String> routeNames = {
  MeatIdentifier(MeatType.pork, '목살'): MocksalDetailScreen.routeName,
  MeatIdentifier(MeatType.pork, '삼겹살'): SamgyeobsalDetailScreen.routeName,
  MeatIdentifier(MeatType.pork, '갈매기살'): GalmaegisalDetailScreen.routeName,
  MeatIdentifier(MeatType.pork, '항정살'): HangjeongsalDetailScreen.routeName,
};
