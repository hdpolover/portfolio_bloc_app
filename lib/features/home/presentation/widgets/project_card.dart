import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portofolio_bloc_app/core/theme/app_colors.dart';
import 'package:portofolio_bloc_app/features/projects/domain/entities/project.dart';
import '../../../../core/utils/responsive.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback? onLearnMorePressed;

  const ProjectCard({
    super.key,
    required this.project,
    this.onLearnMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Responsive.isMobile(context)
          ? 3
          : (Responsive.isTablet(context) ? 4 : 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Responsive.isMobile(context)
            ? 10.r
            : (Responsive.isTablet(context) ? 12.r : 15.r)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Responsive.isMobile(context)
              ? 10.r
              : (Responsive.isTablet(context) ? 12.r : 15.r)),
          image: DecorationImage(
            image: NetworkImage(project.images.first.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Responsive.isMobile(context)
                ? 10.r
                : (Responsive.isTablet(context) ? 12.r : 15.r)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                AppColors.primary.withValues(alpha: 0.7),
                AppColors.primary.withValues(alpha: 0.9),
                AppColors.primary,
              ],
              stops: const [0.0, 0.4, 0.5, 0.6, 1.0],
            ),
          ),
          padding: EdgeInsets.all(Responsive.isMobile(context)
              ? 16.r
              : (Responsive.isTablet(context) ? 14.r : 16.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.isMobile(context)
                      ? 16.sp
                      : (Responsive.isTablet(context) ? 16.sp : 18.sp),
                ),
              ),
              SizedBox(
                  height: Responsive.isMobile(context)
                      ? 8.h
                      : (Responsive.isTablet(context) ? 6.h : 8.h)),
              Text(
                "This is a sample project description. Click to see more details.",
                style: TextStyle(
                  fontSize: Responsive.isMobile(context)
                      ? 14.sp
                      : (Responsive.isTablet(context) ? 12.sp : 14.sp),
                  color: Colors.grey[700],
                ),
                maxLines: Responsive.isMobile(context)
                    ? 3
                    : (Responsive.isTablet(context) ? 2 : 3),
                overflow: TextOverflow.ellipsis,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: onLearnMorePressed,
                  child: Text("Learn More",
                      style: TextStyle(
                          fontSize: Responsive.isMobile(context)
                              ? 14.sp
                              : (Responsive.isTablet(context)
                                  ? 12.sp
                                  : 14.sp))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
