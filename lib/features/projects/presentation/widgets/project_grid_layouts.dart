import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/project.dart';
import 'project_detail_card.dart';

/// Desktop layout for projects grid
class DesktopProjectsGrid extends StatelessWidget {
  final List<Project> projects;
  final String title;

  const DesktopProjectsGrid({
    super.key,
    required this.projects,
    this.title = "All Projects",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 30.h),
          SizedBox(
            height: 600.h,
            child: projects.isEmpty
                ? _buildEmptyState(context)
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 20.h,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: projects.length,
                    itemBuilder: (context, index) => ProjectDetailCard(
                      project: projects[index],
                      onDetailsPressed: () {
                        // Handle project details press
                        context.go(
                          '/projects/${projects[index].id}',
                          extra: projects[index],
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.folder_open,
            size: 80.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20.h),
          Text(
            "No projects available",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Projects will appear here once they are added",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

/// Tablet layout for projects grid
class TabletProjectsGrid extends StatelessWidget {
  final List<Project> projects;
  final String title;

  const TabletProjectsGrid({
    super.key,
    required this.projects,
    this.title = "All Projects",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: projects.isEmpty
                ? _buildEmptyState(context)
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 15.h,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: projects.length,
                    itemBuilder: (context, index) => ProjectDetailCard(
                      project: projects[index],
                      onDetailsPressed: () {},
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.folder_open,
            size: 70.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20.h),
          Text(
            "No projects available",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Projects will appear here once they are added",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

/// Mobile layout for projects grid
class MobileProjectsGrid extends StatelessWidget {
  final List<Project> projects;
  final String title;

  const MobileProjectsGrid({
    Key? key,
    required this.projects,
    this.title = "All Projects",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 15.h),
          Expanded(
            child: projects.isEmpty
                ? _buildEmptyState(context)
                : ListView.builder(
                    itemCount: projects.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: ProjectDetailCard(
                        project: projects[index],
                        onDetailsPressed: () {},
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.folder_open,
            size: 60.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20.h),
          Text(
            "No projects available",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Projects will appear here once they are added",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
