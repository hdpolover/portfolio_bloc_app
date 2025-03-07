import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollControllerService {
  static final ItemScrollController scrollController = ItemScrollController();

  static void scrollToIndex(int index) {
    scrollController.scrollTo(
      index: index,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }
}
