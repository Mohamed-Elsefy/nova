import 'package:flutter/material.dart';
import 'package:nova/core/utils/app_colors.dart';
import 'package:nova/core/widgets/button.dart';
import 'package:nova/features/home/models/product_model.dart';
import 'package:nova/features/home/views/widgets/icon_button.dart';
import 'package:nova/features/home/views/widgets/product_images_carousel.dart';
import 'package:nova/features/home/views/widgets/product_info.dart';
import 'package:nova/generated/l10n.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsView({super.key, required this.product});

  static const double breakPoint = 450;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primColor,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 37,
        actions: [
          IconButtonW(
            iconData: Icons.shopping_basket_outlined,
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < breakPoint) {
            return _verticalLayout(context);
          } else {
            return _horizontalLayout(context);
          }
        },
      ),
    );
  }

  Row _horizontalLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: ProductImagesCarousel(images: product.images)),
        Expanded(
          flex: 2,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              ProductInfo(product: product),

              const SizedBox(height: 15),
              Center(
                child: ButtonW(title: S.of(context).add, onPressed: () {}),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }

  CustomScrollView _verticalLayout(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(
          child: ProductImagesCarousel(images: product.images),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),

        SliverToBoxAdapter(child: ProductInfo(product: product)),
        const SliverToBoxAdapter(child: SizedBox(height: 15)),

        SliverToBoxAdapter(
          child: Center(
            child: ButtonW(title: S.of(context).add, onPressed: () {}),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 30)),
      ],
    );
  }
}
