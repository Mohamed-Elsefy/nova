import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nova/core/utils/app_colors.dart';
import 'package:nova/core/utils/app_text_style.dart';
import 'package:nova/core/widgets/circular_indicator.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: 'https://i.imgur.com/1twoaDy.jpeg',
            placeholder: (context, url) =>
                const Center(child: CircularIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 4),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text('100\$', style: AppTextStyle.h2),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'name',
              style: AppTextStyle.b1,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
