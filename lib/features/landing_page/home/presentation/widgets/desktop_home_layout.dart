import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../core/utils/scroll_controller.dart';
import 'home_section.dart';
import 'projects_section.dart';

class DesktopHomeLayout extends StatelessWidget {
  final List<String> sections = ["Home", "Projects"];

  DesktopHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Portfolio"),
        actions: sections.asMap().entries.map((entry) {
          int index = entry.key;
          String section = entry.value;
          return TextButton(
            onPressed: () => ScrollControllerService.scrollToIndex(index),
            child: Text(
              section,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
          );
        }).toList(),
      ),
      body: ScrollablePositionedList.builder(
        itemScrollController: ScrollControllerService.scrollController,
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return _buildSection(context, index);
        },
      ),
    );
  }

  Widget _buildSection(BuildContext context, int index) {
    switch (index) {
      case 0:
        return HomeSection(context: context);
      case 1:
        return ProjectsSection();
      default:
        return Container(
          height: 600.h,
          alignment: Alignment.center,
          child: Text(
            "Section ${index + 1}",
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),
        );
    }
  }
}
