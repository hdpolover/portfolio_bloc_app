import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portofolio_bloc_app/core/widgets/base_page.dart';
import 'package:portofolio_bloc_app/features/projects/domain/entities/project.dart';
import 'package:portofolio_bloc_app/features/projects/presentation/bloc/project_bloc.dart';
import 'package:portofolio_bloc_app/features/projects/presentation/bloc/project_event.dart';
import 'package:portofolio_bloc_app/features/projects/presentation/bloc/project_state.dart';
import 'package:portofolio_bloc_app/features/projects/presentation/widgets/project_image_carousel.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({
    super.key,
  });

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  late String projectId;

  @override
  void initState() {
    super.initState();

    // Delayed to ensure context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadProjectData();
    });
  }

  void _loadProjectData() {
    // 1. Try to get project ID from the passed project
    // 2. If not available, try to get from route parameters
    projectId = GoRouterState.of(context).pathParameters['id'] ?? '';

    if (projectId.isNotEmpty) {
      context.read<ProjectBloc>().add(LoadProjectById(projectId));
    } else {
      // If we can't get a project ID, show an error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: Project ID not found')),
      );

      // Navigate back if no project ID is found
      Future.delayed(Duration(seconds: 2), () {
        if (mounted) context.pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          //  handle the state from the BLoC
          if (state is ProjectLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProjectOneLoaded) {
            return _buildContent(state.project);
          } else if (state is ProjectError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style: TextStyle(color: Colors.red, fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: _loadProjectData,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // Show a loading indicator as default
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildContent(Project project) {
    List<String> images = project.images.map((e) => e.imageUrl).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project details (left side)
                Expanded(
                  flex: 3,
                  child: _buildDetails(project),
                ),
                SizedBox(width: 32.w),
                // Project device preview (right side)
                Expanded(
                  flex: 2,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 600.h),
                    child: DeviceFrame(
                      device: Devices.ios.iPhone13ProMax,
                      isFrameVisible: true,
                      orientation: Orientation.portrait,
                      screen: images.isNotEmpty
                          ? ProjectImageCarousel(
                              parentHeight: 600.h,
                              imageUrls: images,
                            )
                          : Container(
                              color: Colors.grey[300],
                              child: Center(
                                child: Icon(Icons.image_not_supported,
                                    size: 48.sp),
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(Project project) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 16.h),
          Text(
            project.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 24.h),
          _buildTechnologiesSection(project),
          SizedBox(height: 24.h),
          _buildFeaturesSection(),
          SizedBox(height: 24.h),
          _buildLinksSection(project),
        ],
      ),
    );
  }

  Widget _buildTechnologiesSection(Project project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Technologies',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 8.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: project.techStack.isEmpty
              ? [Chip(label: Text('No technologies specified'))]
              : project.techStack
                  .map((tech) => Chip(
                        label: Text(tech.techStack),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                      ))
                  .toList(),
        ),
      ],
    );
  }

  Widget _buildFeaturesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Features',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 8.h),
        // If project has features property, uncomment and use this
        // Column(
        //   children: widget.project.features.map((feature) => Padding(
        //     padding: EdgeInsets.symmetric(vertical: 4.h),
        //     child: Row(
        //       children: [
        //         Icon(Icons.check_circle_outline, size: 16.sp),
        //         SizedBox(width: 8.w),
        //         Expanded(child: Text(feature)),
        //       ],
        //     ),
        //   )).toList(),
        // ),
        Text('Coming soon', style: TextStyle(fontStyle: FontStyle.italic)),
      ],
    );
  }

  Widget _buildLinksSection(Project project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Links',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            if (project.liveDemoLink.isNotEmpty) ...[
              ElevatedButton.icon(
                onPressed: () => _launchUrl(project.liveDemoLink),
                icon: Icon(Icons.launch),
                label: Text('Live Demo'),
              ),
              SizedBox(width: 16.w),
            ],
            if (project.githubLink.isNotEmpty)
              OutlinedButton.icon(
                onPressed: () => _launchUrl(project.githubLink),
                icon: Icon(Icons.code),
                label: Text('Source Code'),
              ),
            if (project.liveDemoLink.isEmpty && project.githubLink.isEmpty)
              Text('No links available',
                  style: TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
      ],
    );
  }

  void _launchUrl(String url) async {
    if (url.isEmpty) return;

    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
      }
    }
  }
}
