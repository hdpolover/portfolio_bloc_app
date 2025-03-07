import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portofolio_bloc_app/core/utils/logger_service.dart';
import '../../../../core/utils/responsive.dart';
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

    final String imageUrl = project.images.first.imageUrl;
    LoggerService.logInfo("Project image URL: $imageUrl");

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: Responsive.isMobile(context) ? 150.h : 180.h,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Fallback solid color
            Container(color: Colors.grey[200]),

            // Attempt to load image with CachedNetworkImage
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                LoggerService.logError("Failed to load image: $error");

                // Try with Image.network as fallback with cacheWidth for better performance
                return Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  cacheWidth: 800, // Cache at a reasonable size
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    LoggerService.logError(
                        "Fallback image also failed: $error");
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_not_supported,
                              size: 40.sp, color: Colors.grey[500]),
                          SizedBox(height: 8.h),
                          Text(
                            "Image unavailable",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
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
                    label:
                        Text(tech.techStack, style: TextStyle(fontSize: 12.sp)),
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
