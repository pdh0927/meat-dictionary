import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// 검색창
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.isHome,
  });

  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 검색 화면으로 이동
      },
      borderRadius: BorderRadius.circular(45.0),
      child: Container(
        height: isHome ? 54 : 40,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: isHome ? 15.0 : 9.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.0),
          color: isHome ? Colors.white : const Color(0xFFF4F6FA),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 7.2,
              spreadRadius: 0.0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PhosphorIcon(
              PhosphorIcons.magnifyingGlass(),
              color: Colors.black,
              size: isHome ? 25 : 18,
            ),
            const SizedBox(width: 12.0),
            Text(
              '부위별 검색하기',
              style: TextStyle(
                color: const Color(0xFF8E8E93),
                fontSize: isHome ? 18 : 15,
                fontFamily: "Pretendard",
              ),
            )
          ],
        ),
      ),
    );
  }
}
