import 'package:meat_dictionary/meat/model/meat_model.dart';

List<MeatModel> porkList = [
  MeatModel(
    id: 1,
    name: '갈매기살',
    type: MeatType.pork,
    usage: [Usage.grilling], // '구이' -> Usage.grilling
    description: '항정살만큼 부드럽고 쫄깃한 부위',
    texture: MeatTexture.slightlyChewy,
    savoryFlavor: SavoryFlavor.slightlySavory,
    meatAroma: MeatAroma.veryStrong,
    price: 4,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  ),
  MeatModel(
    id: 2,
    name: '목살',
    type: MeatType.pork,
    usage: [Usage.grilling], // '구이' -> Usage.grilling
    description: '부드러움과 풍미의 완벽한 황금비율',
    texture: MeatTexture.slightlySoft,
    savoryFlavor: SavoryFlavor.slightlyMild,
    meatAroma: MeatAroma.veryWeak,
    price: 2,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  ),
  MeatModel(
    id: 3,
    name: '삼겹살',
    type: MeatType.pork,
    usage: [Usage.grilling], // '구이' -> Usage.grilling
    description: '대한민국을 대표 고기',
    texture: MeatTexture.normal,
    savoryFlavor: SavoryFlavor.slightlyMild,
    meatAroma: MeatAroma.weak,
    price: 2,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  ),
  MeatModel(
    id: 4,
    name: '항정살',
    type: MeatType.pork,
    usage: [Usage.cutlet], // '돈가스' -> Usage.cutlet
    description: '부드럽고 담백한',
    texture: MeatTexture.normal,
    savoryFlavor: SavoryFlavor.normal,
    meatAroma: MeatAroma.weak,
    price: 2,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  ),
  MeatModel(
    id: 6,
    name: '앞다리살',
    type: MeatType.pork,
    usage: [
      Usage.cutlet,
      Usage.sweetAndSourPork
    ], // '돈가스', '탕수육' -> Usage.cutlet, Usage.sweetAndSourPork
    description: '잘 고르면 삼겹살 뺨치는 부위',
    texture: MeatTexture.slightlyChewy,
    savoryFlavor: SavoryFlavor.normal,
    meatAroma: MeatAroma.weak,
    price: 2,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  ),
];

List<MeatModel> beefList = [
  MeatModel(
    id: 1,
    name: '아롱사태',
    type: MeatType.beef,
    usage: [Usage.boiledPork], // '수육' -> Usage.boiledPork
    description: '항정살만큼 부드럽고 쫄깃한 부위',
    texture: MeatTexture.slightlyChewy,
    savoryFlavor: SavoryFlavor.normal,
    meatAroma: MeatAroma.weak,
    price: 4,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  ),
  MeatModel(
    id: 2,
    name: '부채살',
    type: MeatType.beef,
    usage: [Usage.grilling], // '구이' -> Usage.grilling
    description: '잘 고르기 도전해보자!',
    texture: MeatTexture.verySoft,
    savoryFlavor: SavoryFlavor.normal,
    meatAroma: MeatAroma.weak,
    price: 2,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  ),
  MeatModel(
    id: 3,
    name: '안창살',
    type: MeatType.beef,
    usage: [Usage.grilling], // '구이' -> Usage.grilling
    description: '잘 고르기 도전해보자!',
    texture: MeatTexture.normal,
    savoryFlavor: SavoryFlavor.slightlyMild,
    meatAroma: MeatAroma.weak,
    price: 2,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  ),
  MeatModel(
    id: 4,
    name: '안심',
    type: MeatType.beef,
    usage: [Usage.steak], // '스테이크' -> Usage.steak
    description: '부드럽고 담백한',
    texture: MeatTexture.normal,
    savoryFlavor: SavoryFlavor.normal,
    meatAroma: MeatAroma.weak,
    price: 2,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  ),
  MeatModel(
    id: 5,
    name: '등심',
    type: MeatType.beef,
    usage: [
      Usage.steak,
      Usage.grilling
    ], // '스테이크', '구이' -> Usage.steak, Usage.grilling
    description: '이건 구이로 먹지 마세요!',
    texture: MeatTexture.slightlyChewy,
    savoryFlavor: SavoryFlavor.normal,
    meatAroma: MeatAroma.weak,
    price: 2,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  ),
  MeatModel(
    id: 6,
    name: '갈비',
    type: MeatType.beef,
    usage: [
      Usage.steak,
      Usage.grilling
    ], // '스테이크', '구이' -> Usage.steak, Usage.grilling
    description: '이건 구이로 먹지 마세요!',
    texture: MeatTexture.slightlyChewy,
    savoryFlavor: SavoryFlavor.normal,
    meatAroma: MeatAroma.weak,
    price: 2,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  ),
];
