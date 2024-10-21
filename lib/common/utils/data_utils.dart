import 'package:firebase_storage/firebase_storage.dart';

// 공통적인 데이터를 조작하는 class
class DataUtils {
  // 주어진 gs:// URL을 다운로드 가능한 URL로 변환
  static Future<String> convertGsToDownloadUrl(String gsPath) async {
    try {
      final ref = FirebaseStorage.instance.refFromURL(gsPath);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error fetching download URL: $e');
      return '';
    }
  }

  // 여러 개의 gs:// URL을 다운로드 가능한 URL로 변환합니다.
  static Future<List<String>> convertMultipleGsToDownloadUrls(
      List<String> gsPaths) async {
    return await Future.wait(gsPaths.map(convertGsToDownloadUrl));
  }
}
