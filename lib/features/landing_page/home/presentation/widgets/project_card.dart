import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/responsive.dart';

class ProjectCard extends StatelessWidget {
  final int index;
  final VoidCallback? onLearnMorePressed;

  const ProjectCard({
    Key? key,
    required this.index,
    this.onLearnMorePressed,
  }) : super(key: key);

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
        padding: EdgeInsets.all(Responsive.isMobile(context)
            ? 16.r
            : (Responsive.isTablet(context) ? 14.r : 16.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Project ${index + 1}",
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
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: onLearnMorePressed,
                child: Text("Learn More",
                    style: TextStyle(
                        fontSize: Responsive.isMobile(context)
                            ? 14.sp
                            : (Responsive.isTablet(context) ? 12.sp : 14.sp))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
