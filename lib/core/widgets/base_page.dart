import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portofolio_bloc_app/core/theme/app_colors.dart';
import 'package:portofolio_bloc_app/core/widgets/custom_button.dart';
import 'package:portofolio_bloc_app/core/widgets/footer.dart';
import 'package:portofolio_bloc_app/core/widgets/top_bar_nav.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class BasePage extends StatefulWidget {
  final Widget content;

  const BasePage({
    super.key,
    required this.content,
  });

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  // Controllers
  late ScrollController _scrollController;

  @override
  void initState() {
    // initialize scroll controllers
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarNav(),
      body: WebSmoothScroll(
        controller: _scrollController,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _scrollController,
          child: Column(
            children: [
              widget.content,
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
