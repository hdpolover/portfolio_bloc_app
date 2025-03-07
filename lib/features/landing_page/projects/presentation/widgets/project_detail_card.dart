import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/responsive.dart';
import '../../domain/entities/project.dart';

class ProjectDetailCard extends StatelessWidget {
  final Project project;
  final VoidCallback? onDetailsPressed;

  const ProjectDetailCard({
    super.key,
    required this.project,
    this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Card(
      elevation: isMobile ? 3 : 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isMobile ? 10.r : 15.r)),
      child: Container(
        padding: EdgeInsets.all(isMobile ? 16.r : 20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProjectImage(context),
            SizedBox(height: project.images.isNotEmpty ? 15.h : 0),
            _buildProjectTitle(context),
            SizedBox(height: isMobile ? 8.h : 10.h),
            _buildProjectDescription(context),
            SizedBox(height: 10.h),
            _buildTechStack(context),
            Spacer(),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectImage(BuildContext context) {
    if (project.images.isEmpty) {
      return SizedBox.shrink();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Image.network(
        project.images.first,
        height: Responsive.isMobile(context) ? 150.h : 180.h,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          height: Responsive.isMobile(context) ? 150.h : 180.h,
          color: Colors.grey[300],
          child: Icon(Icons.image_not_supported,
              size: 50.sp, color: Colors.grey[500]),
        ),
      ),
    );
  }

  Widget _buildProjectTitle(BuildContext context) {
    return Text(
      project.title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: Responsive.isMobile(context) ? 16.sp : 18.sp,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProjectDescription(BuildContext context) {
    return Text(
      project.description,
      style: TextStyle(
          fontSize: Responsive.isMobile(context) ? 14.sp : 15.sp,
          color: Colors.grey[700]),
      maxLines: Responsive.isMobile(context) ? 3 : 4,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTechStack(BuildContext context) {
    if (project.techStack.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 6.w,
          runSpacing: 6.h,
          children: project.techStack
              .map((tech) => Chip(
                    label: Text(tech, style: TextStyle(fontSize: 12.sp)),
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
                  ))
              .toList(),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (project.githubLink.isNotEmpty)
          IconButton(
            icon: Icon(Icons.code, size: 20.sp),
            tooltip: 'GitHub Repository',
            onPressed: () {
              // Add URL launcher functionality here
            },
          ),
        if (project.liveDemoLink.isNotEmpty)
          IconButton(
            icon: Icon(Icons.open_in_new, size: 20.sp),
            tooltip: 'Live Demo',
            onPressed: () {
              // Add URL launcher functionality here
            },
          ),
        TextButton(
          onPressed: onDetailsPressed,
          child: Text("Details",
              style: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 14.sp : 15.sp)),
        ),
      ],
    );
  }
}
