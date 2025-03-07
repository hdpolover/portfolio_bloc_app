import 'package:flutter/material.dart';
import '../../../../../core/utils/responsive.dart';
import '../widgets/desktop_home_layout.dart';
import '../widgets/mobile_home_layout.dart';
import '../widgets/tablet_home_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Responsive.isDesktop(context)) {
          return DesktopHomeLayout();
        } else if (Responsive.isTablet(context)) {
          return TabletHomeLayout();
        } else {
          return MobileHomeLayout();
        }
      },
    );
  }
}
