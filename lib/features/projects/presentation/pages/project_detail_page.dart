import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portofolio_bloc_app/core/widgets/base_page.dart';
import 'package:portofolio_bloc_app/features/projects/domain/entities/project.dart';
import 'package:portofolio_bloc_app/features/projects/presentation/widgets/project_image_carousel.dart';

class ProjectDetailPage extends StatefulWidget {
  final Project project;

  const ProjectDetailPage({
    super.key,
    required this.project,
  });

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  Widget _buildContent() {
    List<String> images = widget.project.images.map((e) => e.imageUrl).toList();

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
                  child: _buildDetails(),
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
                      screen: ProjectImageCarousel(
                        parentHeight: 600.h,
                        imageUrls: images,
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

  _buildDetails() {
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
            widget.project.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 16.h),
          Text(
            widget.project.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 24.h),
          _buildTechnologiesSection(),
          SizedBox(height: 24.h),
          _buildFeaturesSection(),
          SizedBox(height: 24.h),
          _buildLinksSection(),
        ],
      ),
    );
  }

  Widget _buildTechnologiesSection() {
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
          children: widget.project.techStack
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
      ],
    );
  }

  Widget _buildLinksSection() {
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
            ElevatedButton.icon(
              onPressed: () => _launchUrl(widget.project.liveDemoLink),
              icon: Icon(Icons.launch),
              label: Text('Live Demo'),
            ),
            SizedBox(width: 16.w),
            OutlinedButton.icon(
              onPressed: () => _launchUrl(widget.project.githubLink!),
              icon: Icon(Icons.code),
              label: Text('Source Code'),
            ),
          ],
        ),
      ],
    );
  }

  void _launchUrl(String url) {
    // Implement URL launching logic
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: _buildContent(),
    );
  }
}
