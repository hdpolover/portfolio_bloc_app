import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProjectImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double parentHeight;

  const ProjectImageCarousel({
    super.key,
    required this.imageUrls,
    required this.parentHeight,
  });

  @override
  State<ProjectImageCarousel> createState() => _ProjectImageCarouselState();
}

class _ProjectImageCarouselState extends State<ProjectImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) {
      return const SizedBox.shrink();
    }

    // No need for indicator height now
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use constraints to get the actual available height and width
        return CarouselSlider(
          options: CarouselOptions(
            height: constraints.maxHeight, // Use full height
            viewportFraction: 1,
            enlargeCenterPage: true,
            autoPlay: widget.imageUrls.length > 1,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.network(
                    url,
                    fit: BoxFit.contain, // Use contain to keep aspect ratio
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
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(child: Icon(Icons.error)),
                      );
                    },
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
