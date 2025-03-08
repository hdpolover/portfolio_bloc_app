import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portofolio_bloc_app/core/utils/logger_service.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/project.dart';

class ProjectDetailCard extends StatefulWidget {
  final Project project;
  final VoidCallback? onDetailsPressed;

  const ProjectDetailCard({
    super.key,
    required this.project,
    this.onDetailsPressed,
  });

  @override
  State<ProjectDetailCard> createState() => _ProjectDetailCardState();
}

class _ProjectDetailCardState extends State<ProjectDetailCard> {
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  final controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return FlipCard(
      key: cardKey,
      rotateSide: RotateSide.left,
      onTapFlipping:
          true, //When enabled, the card will flip automatically when touched.
      axis: FlipAxis.vertical,
      controller: controller,
      frontWidget: Card(
        elevation: isMobile ? 3 : 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isMobile ? 10.r : 15.r),
        ),
        child: Container(
          padding: EdgeInsets.all(isMobile ? 16.r : 20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectImage(context),
              SizedBox(height: widget.project.images.isNotEmpty ? 15.h : 0),
              _buildProjectTitle(context),
              SizedBox(height: isMobile ? 8.h : 10.h),
              _buildProjectDescription(context),
              SizedBox(height: 10.h),
              _buildTechStack(context),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (widget.project.githubLink.isNotEmpty)
                    IconButton(
                      icon: Icon(Icons.code, size: 20.sp),
                      tooltip: 'GitHub Repository',
                      onPressed: () {
                        // Add URL launcher functionality here
                      },
                    ),
                  if (widget.project.liveDemoLink.isNotEmpty)
                    IconButton(
                      icon: Icon(Icons.open_in_new, size: 20.sp),
                      tooltip: 'Live Demo',
                      onPressed: () {
                        // Add URL launcher functionality here
                      },
                    ),
                  TextButton(
                    onPressed: () {
                      context.goNamed(
                        'project_detail',
                        pathParameters: {'id': widget.project.id.toString()},
                        extra: widget.project,
                      );
                    },
                    child: Text(
                      "Details",
                      style: TextStyle(
                        fontSize: Responsive.isMobile(context) ? 14.sp : 15.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backWidget: Card(
        elevation: isMobile ? 3 : 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isMobile ? 10.r : 15.r),
        ),
        child: Container(
          padding: EdgeInsets.all(isMobile ? 16.r : 20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Project Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.isMobile(context) ? 18.sp : 20.sp,
                ),
              ),
              SizedBox(height: 15.h),
              // Add more detailed info here
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    widget.project.description,
                    style: TextStyle(
                      fontSize: Responsive.isMobile(context) ? 14.sp : 15.sp,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    cardKey.currentState?.flipCardController
                        .flipcard(); // Flip back to front
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: Responsive.isMobile(context) ? 14.sp : 15.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectImage(BuildContext context) {
    if (widget.project.images.isEmpty) {
      return SizedBox.shrink();
    }

    final String imageUrl = widget.project.images.first.imageUrl;
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
      widget.project.title,
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
      widget.project.description,
      style: TextStyle(
          fontSize: Responsive.isMobile(context) ? 14.sp : 15.sp,
          color: Colors.grey[700]),
      maxLines: Responsive.isMobile(context) ? 3 : 4,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTechStack(BuildContext context) {
    if (widget.project.techStack.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
            spacing: 6.w,
            runSpacing: 6.h,
            children: widget.project.techStack.map((tech) {
              String name = tech.techStackDetails.name;

              return Chip(
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                label: Text(
                  name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: Responsive.isMobile(context) ? 12.sp : 14.sp,
                      ),
                ),
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
              );
            }).toList()),
        SizedBox(height: 10.h),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (widget.project.githubLink.isNotEmpty)
          IconButton(
            icon: Icon(Icons.code, size: 20.sp),
            tooltip: 'GitHub Repository',
            onPressed: () {
              // Add URL launcher functionality here
            },
          ),
        if (widget.project.liveDemoLink.isNotEmpty)
          IconButton(
            icon: Icon(Icons.open_in_new, size: 20.sp),
            tooltip: 'Live Demo',
            onPressed: () {
              // Add URL launcher functionality here
            },
          ),
        TextButton(
          onPressed: widget.onDetailsPressed,
          child: Text("Details",
              style: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 14.sp : 15.sp)),
        ),
      ],
    );
  }
}
