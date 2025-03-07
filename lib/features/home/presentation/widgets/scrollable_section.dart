import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollableSection extends StatelessWidget {
  final ItemScrollController scrollController = ItemScrollController();
  final List<String> sections = ["Home", "Projects", "Testimonials", "Contact"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text("My Portfolio"),
          actions: sections.asMap().entries.map((entry) {
            int index = entry.key;
            return TextButton(
              onPressed: () => scrollController.scrollTo(
                index: index,
                duration: Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              ),
              child: Text(entry.value, style: TextStyle(color: Colors.white)),
            );
          }).toList(),
        ),
        Expanded(
          child: ScrollablePositionedList.builder(
            itemScrollController: scrollController,
            itemCount: sections.length,
            itemBuilder: (context, index) {
              return Container(
                height: 600.h,
                alignment: Alignment.center,
                child: Text(sections[index],
                    style: Theme.of(context).textTheme.displayLarge),
              );
            },
          ),
        ),
      ],
    );
  }
}
