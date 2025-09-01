import 'package:flutter/material.dart';
import 'package:nova/core/functions/calc_padding.dart';
import 'package:nova/core/utils/app_colors.dart';
import 'package:nova/core/utils/app_text_style.dart';
import 'package:nova/features/home/models/product_model.dart';
import 'package:nova/generated/l10n.dart';

class ProductInfo extends StatelessWidget {
  final ProductModel product;

  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final hPadding = calcPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title, style: AppTextStyle.h2),
          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                decoration: BoxDecoration(
                  color: AppColors.primColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${product.price} \$',
                  style: AppTextStyle.b2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          Text(
            S.of(context).details,
            style: AppTextStyle.b1.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),

          Text(product.description, style: AppTextStyle.b1),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
