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
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fgalmaegisal%2Fgalmaegisal_thumbnail.png?alt=media&token=d9406c2b-3f06-4f16-8c29-57b6ffcfb192',
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
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fmocksal%2Fmocksal_thumnail.png?alt=media&token=c0dc30bf-d296-4188-b8b6-892f803dab7f',
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
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fsamgyeobsal%2Fsamgyeobsal_thumbnail.png?alt=media&token=dffdac7d-5756-4e54-9d9b-1a76e1ada119',
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
    name: '채끝살',
    type: MeatType.beef,
    usage: [Usage.boiledPork], // '수육' -> Usage.boiledPork
    description: '육향과 식감의 조화로운 밸런스',
    texture: MeatTexture.slightlyChewy,
    savoryFlavor: SavoryFlavor.normal,
    meatAroma: MeatAroma.weak,
    price: 4,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fchaekkeutsal%2Fchaekkeutsal_thumbnail.png?alt=media&token=76ed68d1-00c0-47cf-81ff-a97864f5c940',
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
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fbuchaesal%2Fbuchaesal_thumbnail.png?alt=media&token=0bf37a29-166a-44e6-8d43-3dd44e4d60cb',
  ),
  MeatModel(
    id: 3,
    name: '살치살',
    type: MeatType.beef,
    usage: [Usage.grilling], // '구이' -> Usage.grilling
    description: '잘 고르기 도전해보자!',
    texture: MeatTexture.normal,
    savoryFlavor: SavoryFlavor.slightlyMild,
    meatAroma: MeatAroma.weak,
    price: 2,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fsalchisal%2Fsalchisal_thumbnail.png?alt=media&token=27e6ce3b-526c-46a1-b2a9-8735bc63c6c9',
  ),
  MeatModel(
    id: 4,
    name: '안심',
    type: MeatType.beef,
    usage: [Usage.steak], // '스테이크' -> Usage.steak
    description: '끝판왕 스테이크 부위',
    texture: MeatTexture.normal,
    savoryFlavor: SavoryFlavor.normal,
    meatAroma: MeatAroma.weak,
    price: 2,
    imgPath:
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fansim%2Fansim_thumbnail.png?alt=media&token=15ad8ca1-32ca-4613-9e22-c88aa45d342a',
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
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fdeungsim%2Fdeungsim_thumbnail.png?alt=media&token=3960b09c-f9bb-4b20-8b15-474ec5fbb039',
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
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fgalbi%2Fgalbi_thumbnail.png?alt=media&token=cfcbcf04-e9f0-44d4-994c-dc00e70ac5e3',
  ),
  // MeatModel(
  //   id: 7,
  //   name: '토시살',
  //   type: MeatType.beef,
  //   usage: [
  //     Usage.steak,
  //     Usage.grilling
  //   ], // '스테이크', '구이' -> Usage.steak, Usage.grilling
  //   description: '이건 구이로 먹지 마세요!',
  //   texture: MeatTexture.slightlyChewy,
  //   savoryFlavor: SavoryFlavor.normal,
  //   meatAroma: MeatAroma.weak,
  //   price: 2,
  //   imgPath:
  //       'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  // ),
  // MeatModel(
  //   id: 8,
  //   name: '업진살',
  //   type: MeatType.beef,
  //   usage: [
  //     Usage.steak,
  //     Usage.grilling
  //   ], // '스테이크', '구이' -> Usage.steak, Usage.grilling
  //   description: '이건 구이로 먹지 마세요!',
  //   texture: MeatTexture.slightlyChewy,
  //   savoryFlavor: SavoryFlavor.normal,
  //   meatAroma: MeatAroma.weak,
  //   price: 2,
  //   imgPath:
  //       'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fhangjeongsal%2Fhangjeongsal_thubnail.png?alt=media&token=cf3786a4-14c0-467d-8e18-de0ff7a97dda',
  // ),
  MeatModel(
    id: 9,
    name: '차돌박이',
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
        'https://firebasestorage.googleapis.com/v0/b/meat-dictionary.appspot.com/o/meat-detail%2Fbeef%2Fchadolbagi%2Fchadolbagi_thumbnail.png?alt=media&token=9314ac6a-d5ea-46ce-88b7-2517f955bfd1',
  ),
];
