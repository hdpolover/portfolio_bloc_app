import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/utils/scroll_controller.dart';

class HomeSection extends StatelessWidget {
  final BuildContext context;

  const HomeSection({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Container(
      height: isMobile ? 400.h : (isTablet ? 500.h : 600.h),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          // Load a Lottie file from your assets
          Positioned(
            right: 0,
            bottom: 0,
            child: Lottie.asset(
              renderCache: RenderCache.raster,
              frameRate: FrameRate.composition,
              'anim.json',
              height: isMobile ? 300.h : (isTablet ? 400.h : 500.h),
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20.w : (isTablet ? 30.w : 100.w),
              vertical: isMobile ? 20.h : (isTablet ? 30.h : 40.h),
            ),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to My Space!",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: isMobile ? 10.h : (isTablet ? 15.h : 20.h)),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "I'm a Flutter Developer",
                      textStyle:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 20.h : (isTablet ? 25.h : 30.h)),
                _buildActionButton(context),
              ],
            ),
          ),
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
