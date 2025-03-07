import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portofolio_bloc_app/core/theme/app_colors.dart';
import 'package:portofolio_bloc_app/features/dashboard/presentation/pages/tabs/experience_content.dart';
import 'package:portofolio_bloc_app/features/dashboard/presentation/pages/tabs/projects/project_content.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
                // showTooltip: false,
                displayMode: SideMenuDisplayMode.auto,
                showHamburger: false,
                hoverColor: Colors.blue[100],
                selectedHoverColor: Colors.blue[100],
                selectedColor: AppColors.primary,
                selectedTitleTextStyle: const TextStyle(color: Colors.white),
                selectedIconColor: Colors.white,
                backgroundColor: AppColors.primary),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 200,
                    maxWidth: 150,
                  ),
                  child: Center(
                      child: Text("HendraCodes",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white))),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: Text(
                    'HendraCodes',
                    style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  ),
                ),
              ),
            ),
            items: [
              SideMenuItem(
                title: 'Projects',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(FontAwesomeIcons.diagramProject),
              ),
              SideMenuItem(
                title: 'Experiences',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(FontAwesomeIcons.briefcase),
              ),
            ],
          ),
          const VerticalDivider(
            width: 0,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                ProjectContent(),
                ExperienceContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
