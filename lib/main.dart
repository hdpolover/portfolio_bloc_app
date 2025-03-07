import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portofolio_bloc_app/core/theme/app_theme.dart';
import 'package:portofolio_bloc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:portofolio_bloc_app/features/projects/presentation/bloc/project_bloc.dart';
import 'package:portofolio_bloc_app/init_dependencies.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'core/navigation/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // This sets the URL strategy for Flutter Web to use clean URLs (no hash)
  setUrlStrategy(PathUrlStrategy());

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // load injection container
  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<ProjectBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(1440, 900), // Desktop resolution
        minTextAdapt: true, // Ensures text scales properly
        builder: (context, child) {
          return MaterialApp.router(
            title: 'My Portfolio',
            theme: AppTheme().codeClarityTheme, // Apply responsive theme
            routerConfig: appRouter, // Use GoRouter
          );
        },
      ),
    );
  }
}
