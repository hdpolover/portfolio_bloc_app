import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portofolio_bloc_app/core/widgets/custom_button.dart';

class TopBarNav extends StatelessWidget implements PreferredSizeWidget {
  const TopBarNav({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Theme.of(context).shadowColor,
      flexibleSpace: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'HendraCodes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      onPressed: () {
                        context.goNamed('home');
                      },
                      child: const Text('Home')),
                  const SizedBox(width: 20),
                  CustomButton(
                      onPressed: () {
                        context.goNamed('about');
                      },
                      child: const Text('About Me')),
                  const SizedBox(width: 20),
                  CustomButton(
                      onPressed: () {
                        context.goNamed('projects');
                      },
                      child: const Text('Projects')),
                  const SizedBox(width: 20),
                  CustomButton(onPressed: () {}, child: const Text('Contact')),
                ],
              ),
            ),
          ],
        ),
      ),
      // actions: [
      //   CustomButton(
      //       onPressed: () {
      //         context.pushNamed('home');
      //       },
      //       child: const Text('Home')),
      //   CustomButton(
      //       onPressed: () {
      //         context.pushNamed('projects');
      //       },
      //       child: const Text('Projects')),
      //   CustomButton(onPressed: () {}, child: const Text('About Me')),
      //   CustomButton(onPressed: () {}, child: const Text('Contact')),
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
