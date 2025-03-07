import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portofolio_bloc_app/core/utils/logger_service.dart';
import 'package:portofolio_bloc_app/features/projects/presentation/bloc/project_event.dart';
import 'package:portofolio_bloc_app/features/projects/presentation/bloc/project_state.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../init_dependencies.dart';
import '../../../projects/presentation/bloc/project_bloc.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  final List<int> projectIndices = [0, 1, 2, 3, 4, 5]; // Mock projects indices

  ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    // Simulate empty projects list for testing (remove in production)
    // final projects = <int>[];
    final projects = projectIndices;

    return Container(
      height: isMobile
          ? MediaQuery.of(context).size.height * 0.9
          : (isTablet ? 500.h : 600.h),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 25.w : (isTablet ? 50.w : 100.w),
        vertical: isMobile ? 20.h : (isTablet ? 30.h : 40.h),
      ),
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Projects",
            style: TextStyle(
              fontSize: isMobile ? 24.sp : (isTablet ? 30.sp : 36.sp),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: isMobile ? 15.h : (isTablet ? 20.h : 30.h)),
          Expanded(
            child: projects.isEmpty
                ? _buildEmptyState(context)
                : _buildProjectsGrid(context, projects),
          ),
          SizedBox(height: isMobile ? 15.h : 20.h),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => context.go('/projects'),
              icon:
                  Icon(Icons.grid_view_rounded, size: isMobile ? 16.sp : null),
              label: Text(
                "View All Projects",
                style: TextStyle(
                    fontSize: isMobile ? 14.sp : (isTablet ? 14.sp : 16.sp)),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 0 : (isTablet ? 25.w : 30.w),
                  vertical: isMobile ? 12.h : (isTablet ? 12.h : 15.h),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.folder_open,
            size: isMobile ? 60.sp : (isTablet ? 70.sp : 80.sp),
            color: Colors.grey[400],
          ),
          SizedBox(height: 20.h),
          Text(
            "No featured projects yet",
            style: TextStyle(
              fontSize: isMobile ? 20.sp : (isTablet ? 22.sp : 24.sp),
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Check 'View All Projects' to see my complete portfolio",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 14.sp : 16.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context, List<int> projects) {
    if (Responsive.isMobile(context)) {
      return ListView.builder(
        itemCount: projects.length > 4 ? 4 : projects.length,
        itemBuilder: (context, idx) => Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Text(""),
        ),
      );
    } else if (Responsive.isTablet(context)) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
          childAspectRatio: 1.3,
        ),
        itemCount: projects.length > 4 ? 4 : projects.length,
        itemBuilder: (context, idx) => Text(""),
      );
    } else {
      return BlocProvider(
        create: (context) => serviceLocator<ProjectBloc>()..add(LoadProjects()),
        child: BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            if (state is ProjectLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProjectLoaded) {
              final children = state.projects
                  .map((project) => ProjectCard(
                        project: project,
                        onLearnMorePressed: () {
                          print("Learn more about ${project.title}");
                          context.go(
                            '/projects/${project.id}',
                            extra: project,
                          );
                        },
                      ))
                  .toList();

              return CarouselView(itemExtent: 300.w, children: children);
            } else if (state is ProjectError) {
              return Center(child: Text("Error: ${state.message}"));
            }

            LoggerService.logInfo('Current state: ${state.toString()}');
            return const Center(child: Text('No projects found.'));
          },
        ),
      );
    }
  }
}
