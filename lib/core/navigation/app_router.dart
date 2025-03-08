import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portofolio_bloc_app/features/about/presentation/about_page.dart';
import 'package:portofolio_bloc_app/features/auth/presentation/pages/auth_page.dart';
import 'package:portofolio_bloc_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:portofolio_bloc_app/features/projects/domain/entities/project.dart';
import 'package:portofolio_bloc_app/features/projects/presentation/pages/project_detail_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/projects/presentation/pages/project_page.dart';

transitionPage(BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // admin routes
    GoRoute(
      path: '/auth',
      name: 'auth',
      pageBuilder: (context, state) =>
          transitionPage(context, state, AuthPage()),
    ),

    // dashboard
    GoRoute(
      path: '/dashboard',
      name: 'dashboard',
      pageBuilder: (context, state) => transitionPage(
        context,
        state,
        DashboardPage(),
      ),
    ),

    // public routes
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => transitionPage(
        context,
        state,
        HomePage(),
      ),
    ),
    GoRoute(
      path: '/projects',
      name: 'projects',
      pageBuilder: (context, state) => transitionPage(
        context,
        state,
        ProjectPage(),
      ),
      routes: [
        GoRoute(
          path: ':id',
          name: 'project_detail',
          pageBuilder: (context, state) {
            return transitionPage(
              context,
              state,
              ProjectDetailPage(),
            );
          },
        ),
      ],
    ),

    // about
    GoRoute(
      path: '/about',
      name: 'about',
      pageBuilder: (context, state) => transitionPage(
        context,
        state,
        const AboutPage(),
      ),
    ),
  ],
);
