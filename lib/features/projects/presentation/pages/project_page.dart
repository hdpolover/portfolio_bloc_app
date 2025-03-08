import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portofolio_bloc_app/core/utils/logger_service.dart';
import 'package:portofolio_bloc_app/core/widgets/app_loading.dart';
import 'package:portofolio_bloc_app/core/widgets/base_page.dart';
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
      child: BasePage(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 20.w : 50.w,
                vertical: Responsive.isMobile(context) ? 10.h : 20.h,
              ),
              child: Text(
                "My Projects",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: Responsive.isMobile(context) ? 24.sp : 36.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
            SizedBox(height: 30.h),
            const ProjectFilters(),
            BlocBuilder<ProjectBloc, ProjectState>(
              builder: (context, state) {
                if (state is ProjectLoading) {
                  return AppLoading(
                    loadingText: 'Loading project details...',
                    size: 50.sp,
                    containerHeight: MediaQuery.of(context).size.height * 0.5,
                  );
                } else if (state is ProjectLoaded) {
                  return _buildProjectsList(context, state.projects);
                } else if (state is ProjectError) {
                  return Center(child: Text("Error: ${state.message}"));
                }

                LoggerService.logInfo('Current state: ${state.toString()}');
                return const Center(child: Text('No projects found.'));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsList(BuildContext context, List<Project> projects) {
    final filtered = _applyFilters(context, projects);
    if (Responsive.isDesktop(context)) {
      return DesktopProjectsGrid(projects: filtered);
    } else if (Responsive.isTablet(context)) {
      return TabletProjectsGrid(projects: filtered);
    } else {
      return MobileProjectsGrid(projects: filtered);
    }
  }

  List<Project> _applyFilters(BuildContext context, List<Project> projects) {
    final state = context.watch<ProjectBloc>().state;
    if (state is! ProjectLoaded) return projects;

    var filtered = [...projects];

    if (state.selectedTechStack != null) {
      filtered = filtered
          .where((p) => p.techStack.any(
              (tech) => tech.techStackDetails.name == state.selectedTechStack))
          .toList();
    }

    if (state.sortByDate != null) {
      filtered.sort((a, b) => state.sortByDate == 'asc'
          ? a.createdAt.compareTo(b.createdAt)
          : b.createdAt.compareTo(a.createdAt));
    }

    return filtered;
  }
}

class ProjectFilters extends StatelessWidget {
  const ProjectFilters({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProjectBloc>().state;
    final bloc = context.read<ProjectBloc>();
    final techStacks = ['Flutter', 'React', 'Node.js', 'Python'];

    String? selectedTechStack;
    String? sortByDate;

    if (state is ProjectLoaded) {
      selectedTechStack = state.selectedTechStack;
      sortByDate = state.sortByDate;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DropdownButton<String>(
            value: selectedTechStack,
            hint: const Text('Filter by Tech Stack'),
            onChanged: (value) => bloc.add(FilterByTechStack(value)),
            items: techStacks
                .map((tech) => DropdownMenuItem(
                      value: tech,
                      child: Text(tech),
                    ))
                .toList(),
          ),
          const SizedBox(width: 16),
          DropdownButton<String>(
            value: sortByDate,
            hint: const Text('Sort by Date'),
            onChanged: (value) => bloc.add(SortByDate(value)),
            items: const [
              DropdownMenuItem(value: 'asc', child: Text('Oldest First')),
              DropdownMenuItem(value: 'desc', child: Text('Newest First')),
            ],
          ),
        ],
      ),
    );
  }
}
