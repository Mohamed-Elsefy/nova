import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nova/core/widgets/circular_indicator.dart';

class ProductImagesCarousel extends StatelessWidget {
  const ProductImagesCarousel({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map((i) {
        return Builder(
          builder: (context) => CachedNetworkImage(
            imageUrl: i,
            placeholder: (context, url) =>
                const Center(child: CircularIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        aspectRatio: 10 / 9.5,
        enlargeCenterPage: true,
        enlargeFactor: .25,
        viewportFraction: .77,
      ),
    );
  }
}
