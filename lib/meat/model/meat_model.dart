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

enum MeatTexture {
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

extension TextureExtension on MeatTexture {
  String get label {
    switch (this) {
      case MeatTexture.verySoft:
        return '부드러움';
      case MeatTexture.slightlySoft:
        return '약간 부드러움';
      case MeatTexture.normal:
        return '보통';
      case MeatTexture.slightlyChewy:
        return '약간 쫄깃함';
      case MeatTexture.chewy:
        return '쫄깃함';
    }
  }

  double get sliderValue {
    switch (this) {
      case MeatTexture.verySoft:
        return 0.0;
      case MeatTexture.slightlySoft:
        return 0.2;
      case MeatTexture.normal:
        return 0.4;
      case MeatTexture.slightlyChewy:
        return 0.6;
      case MeatTexture.chewy:
        return 0.8;
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

  double get sliderValue {
    switch (this) {
      case MeatAroma.veryWeak:
        return 0.0;
      case MeatAroma.weak:
        return 0.2;
      case MeatAroma.normal:
        return 0.4;
      case MeatAroma.strong:
        return 0.6;
      case MeatAroma.veryStrong:
        return 0.8;
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

  double get sliderValue {
    switch (this) {
      case SavoryFlavor.mild:
        return 0.0;
      case SavoryFlavor.slightlyMild:
        return 0.2;
      case SavoryFlavor.normal:
        return 0.4;
      case SavoryFlavor.slightlySavory:
        return 0.6;
      case SavoryFlavor.savory:
        return 0.8;
    }
  }
}

class MeatModel {
  int id;
  String name;
  MeatType type;
  List<Usage> usage;
  String description;
  MeatTexture texture;
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
