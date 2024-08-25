import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// 나중에 모든 screen widget들에 api를 불러와야하거나 다른 작업을 해야할 때 이 위젯 안에 감싸서 넣으면 모든 screen에 한번에 적용 가능
class DefaultLayout extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final String? title;
  final BottomNavigationBar? bottomNavigationBar;
  final List<Widget>? actions;
  final Widget? leading;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    this.actions,
    this.bottomNavigationBar,
    this.title,
    this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: renderAppBar(),
        backgroundColor: backgroundColor ?? Colors.white,
        body: child,
        bottomNavigationBar: bottomNavigationBar,
      );
    });
  }

  AppBar? renderAppBar() {
    if (title == null && actions == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: leading,
        title: title != null
            ? Text(title!,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ))
            : null,
        centerTitle: true,
        titleSpacing: 25,
        actions: actions ?? [],
        foregroundColor: Colors.black,
      );
    }
  }
}
