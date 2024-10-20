import 'package:flutter_riverpod/flutter_riverpod.dart';

// 루트탭 인덱스 관리 provider
final rootTabIndexProvider = StateProvider<int>((ref) => 0);
