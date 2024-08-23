enum MeatType {
  pork,
  beef,
  // 필요한 다른 타입도 여기에 추가 가능
}

extension MeatTypeExtension on MeatType {
  String get label {
    switch (this) {
      case MeatType.pork:
        return '돼지고기';
      case MeatType.beef:
        return '소고기';
    }
  }
}

enum Usage {
  grilling, // 구이
  boiledPork, // 수육
  soup, // 국거리
  bulgogi, // 불고기
  cutlet, // 돈가스
  sweetAndSourPork, // 탕수육
  steak, // 스테이크
}

extension UsageExtension on Usage {
  String get label {
    switch (this) {
      case Usage.grilling:
        return '구이';
      case Usage.boiledPork:
        return '수육';
      case Usage.soup:
        return '국거리';
      case Usage.bulgogi:
        return '불고기';
      case Usage.cutlet:
        return '돈가스';
      case Usage.sweetAndSourPork:
        return '탕수육';
      case Usage.steak:
        return '스테이크';
    }
  }
}

enum Texture {
  verySoft,
  slightlySoft,
  normal,
  slightlyChewy,
  chewy,
}

enum MeatAroma {
  veryWeak,
  weak,
  normal,
  strong,
  veryStrong,
}

enum SavoryFlavor {
  mild,
  slightlyMild,
  normal,
  slightlySavory,
  savory,
}

extension TextureExtension on Texture {
  String get label {
    switch (this) {
      case Texture.verySoft:
        return '부드러움';
      case Texture.slightlySoft:
        return '약간 부드러움';
      case Texture.normal:
        return '보통';
      case Texture.slightlyChewy:
        return '약간 쫄깃함';
      case Texture.chewy:
        return '쫄깃함';
    }
  }
}

extension MeatAromaExtension on MeatAroma {
  String get label {
    switch (this) {
      case MeatAroma.veryWeak:
        return '매우 약함';
      case MeatAroma.weak:
        return '약함';
      case MeatAroma.normal:
        return '적당함';
      case MeatAroma.strong:
        return '강함';
      case MeatAroma.veryStrong:
        return '매우 강함';
    }
  }
}

extension SavoryFlavorExtension on SavoryFlavor {
  String get label {
    switch (this) {
      case SavoryFlavor.mild:
        return '담백함';
      case SavoryFlavor.slightlyMild:
        return '약간 담백함';
      case SavoryFlavor.normal:
        return '보통';
      case SavoryFlavor.slightlySavory:
        return '약간 고소함';
      case SavoryFlavor.savory:
        return '고소함';
    }
  }
}

class MeatModel {
  int id;
  String name;
  MeatType type;
  List<Usage> usage;
  String description;
  Texture texture;
  SavoryFlavor savoryFlavor;
  MeatAroma meatAroma;
  int price;
  String imgPath;

  MeatModel({
    required this.id,
    required this.name,
    required this.type,
    required this.usage,
    required this.description,
    required this.texture,
    required this.savoryFlavor,
    required this.meatAroma,
    required this.price,
    required this.imgPath,
  });
}
