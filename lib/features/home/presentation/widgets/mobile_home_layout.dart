import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../core/utils/scroll_controller.dart';
import 'home_section.dart';
import 'projects_section.dart';

class MobileHomeLayout extends StatelessWidget {
  final List<String> sections = ["Home", "Projects"];

  MobileHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Portfolio", style: TextStyle(fontSize: 18.sp)),
        centerTitle: true,
      ),
      drawer: _buildDrawer(context),
      body: ScrollablePositionedList.builder(
        itemScrollController: ScrollControllerService.scrollController,
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return _buildSection(context, index);
        },
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
          ...sections.asMap().entries.map((entry) {
            int index = entry.key;
            String section = entry.value;
            return ListTile(
              title: Text(section),
              onTap: () {
                ScrollControllerService.scrollToIndex(index);
                Navigator.pop(context); // Close drawer
              },
            );
          }),
          Divider(),
          ListTile(
            leading: Icon(Icons.grid_view_rounded),
            title: Text("All Projects"),
            onTap: () {
              Navigator.pop(context); // Close drawer
              context.go('/projects'); // Navigate to projects page
            },
          ),
        ],
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
          height: MediaQuery.of(context).size.height * 0.9,
          alignment: Alignment.center,
          child: Text(
            "Section ${index + 1}",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        );
    }
  }
}
