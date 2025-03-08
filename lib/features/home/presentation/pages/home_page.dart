import 'package:flutter/material.dart';
import 'package:portofolio_bloc_app/core/widgets/base_page.dart';
import '../widgets/desktop_home_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(content: DesktopHomeLayout());
    // return LayoutBuilder(
    //   builder: (context, constraints) {
    //     if (Responsive.isDesktop(context)) {
    //       return DesktopHomeLayout();
    //     }

    //     return DesktopHomeLayout();
    //     // } else if (Responsive.isTablet(context)) {
    //     //   return TabletHomeLayout();
    //     // } else {
    //     //   return MobileHomeLayout();
    //     // }
    //   },
    // );
  }
}
