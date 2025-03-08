import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_section.dart';
import 'projects_section.dart';

class DesktopHomeLayout extends StatefulWidget {
  const DesktopHomeLayout({super.key});

  @override
  State<DesktopHomeLayout> createState() => _DesktopHomeLayoutState();
}

class _DesktopHomeLayoutState extends State<DesktopHomeLayout> {
  final List<String> sections = ["Home", "Projects", "About Me", "Contact"];

  @override
  Widget build(BuildContext context) {
    return _buildScrollableList();
  }

  Widget _buildScrollableList() {
    return Column(
      children: List.generate(
        sections.length,
        (index) => SizedBox(
          height: index == 0 ? 600.h : 800.h,
          child: _buildSection(context, index),
        ),
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
