import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../core/utils/scroll_controller.dart';

class HomeSection extends StatelessWidget {
  final BuildContext context;

  const HomeSection({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Container(
      height: isMobile
          ? MediaQuery.of(context).size.height * 0.9
          : (isTablet ? 500.h : 600.h),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 25.w : (isTablet ? 50.w : 100.w),
        vertical: isMobile ? 20.h : (isTablet ? 30.h : 40.h),
      ),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to My Portfolio",
            style: TextStyle(
              fontSize: isMobile ? 28.sp : (isTablet ? 36.sp : 48.sp),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: isMobile ? 10.h : (isTablet ? 15.h : 20.h)),
          Text(
            "I'm a Flutter Developer",
            style: TextStyle(
              fontSize: isMobile ? 16.sp : (isTablet ? 20.sp : 24.sp),
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: isMobile ? 20.h : (isTablet ? 25.h : 30.h)),
          _buildActionButton(context),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    if (isMobile) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => ScrollControllerService.scrollToIndex(1),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
          child: Text("View Projects", style: TextStyle(fontSize: 14.sp)),
        ),
      );
    }

    return ElevatedButton(
      onPressed: () => ScrollControllerService.scrollToIndex(1),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 25.w : 30.w,
          vertical: isTablet ? 12.h : 15.h,
        ),
      ),
      child: Text(
        "View Projects",
        style: TextStyle(fontSize: isTablet ? 14.sp : 16.sp),
      ),
    );
  }
}
