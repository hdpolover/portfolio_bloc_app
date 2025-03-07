import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portofolio_bloc_app/features/about/presentation/about_page.dart';
import 'package:portofolio_bloc_app/features/auth/presentation/pages/auth_page.dart';
import 'package:portofolio_bloc_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:portofolio_bloc_app/features/projects/domain/entities/project.dart';
import 'package:portofolio_bloc_app/features/projects/presentation/pages/project_detail_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/projects/presentation/pages/project_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // admin routes
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) => AuthPage(),
    ),

    // dashboard
    GoRoute(
      path: '/dashboard',
      name: 'dashboard',
      builder: (context, state) => DashboardPage(),
    ),

    // public routes
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/projects',
      name: 'projects',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: ProjectPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
      routes: [
        GoRoute(
          path: ':id',
          name: 'project_detail',
          pageBuilder: (context, state) {
            final project = state.extra as Project;
            return MaterialPage(
              key: state.pageKey,
              child: ProjectDetailPage(
                project: project,
              ),
            );
          },
        ),
      ],
    ),

    // about
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => AboutPage(),
    ),
  ],
);
