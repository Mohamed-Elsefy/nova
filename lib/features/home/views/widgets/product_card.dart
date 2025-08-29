import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nova/core/utils/app_colors.dart';
import 'package:nova/core/utils/app_text_style.dart';
import 'package:nova/core/widgets/circular_indicator.dart';
import 'package:nova/features/home/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 7, offset: Offset(0, 2)),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: product.images[0],
            placeholder: (context, url) =>
                const Center(child: CircularIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text('${product.price} \$', style: AppTextStyle.h2),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              product.title,
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
