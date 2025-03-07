import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/landing_page/home/presentation/screens/home_page.dart';
import '../../features/landing_page/projects/presentation/pages/project_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/projects',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: ProjectPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
  ],
);


// bool isLoggedIn = true; // Replace this with actual authentication logic

// final GoRouter appRouter = GoRouter(
//   initialLocation: '/',
//   routes: [
//     // Public Routes
//     GoRoute(path: '/', builder: (context, state) => const HomePage()),
//     GoRoute(path: '/projects', builder: (context, state) => const ProjectPage()),
//     GoRoute(path: '/blog', builder: (context, state) => const BlogPage()),
//     GoRoute(path: '/testimonials', builder: (context, state) => const TestimonialPage()),

//     // **Nested Admin Routes (Protected)**
//     GoRoute(
//       path: '/admin',
//       redirect: (context, state) => isLoggedIn ? null : '/',
//       builder: (context, state) => const AdminDashboard(),
//       routes: [
//         GoRoute(
//           path: 'projects',
//           builder: (context, state) => const ManageProjectsPage(),
//         ),
//         GoRoute(
//           path: 'blog',
//           builder: (context, state) => const ManageBlogPage(),
//         ),
//       ],
//     ),
//   ],
// );