import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portofolio_bloc_app/core/utils/logger_service.dart';
import 'package:portofolio_bloc_app/core/widgets/top_bar_nav.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../init_dependencies.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_event.dart';
import '../bloc/project_state.dart';
import '../../domain/entities/project.dart';
import '../widgets/project_grid_layouts.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<ProjectBloc>()..add(LoadProjects()),
      child: Scaffold(
        appBar: TopBarNav(),
        body: BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            if (state is ProjectLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProjectLoaded) {
              return _buildProjectsList(context, state.projects);
            } else if (state is ProjectError) {
              return Center(child: Text("Error: ${state.message}"));
            }

            LoggerService.logInfo('Current state: ${state.toString()}');
            return const Center(child: Text('No projects found.'));
          },
        ),
      ),
    );
  }

  Widget _buildProjectsList(BuildContext context, List<Project> projects) {
    if (Responsive.isDesktop(context)) {
      return DesktopProjectsGrid(projects: projects);
    } else if (Responsive.isTablet(context)) {
      return TabletProjectsGrid(projects: projects);
    } else {
      return MobileProjectsGrid(projects: projects);
    }
  }
}
