import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova/core/functions/calc_padding.dart';
import 'package:nova/core/utils/app_colors.dart';
import 'package:nova/core/utils/app_text_style.dart';
import 'package:nova/core/widgets/circular_indicator.dart';
import 'package:nova/core/widgets/error.dart';
import 'package:nova/features/home/cubit/home_cubit.dart';
import 'package:nova/features/home/cubit/home_state.dart';
import 'package:nova/features/home/models/product_model.dart';
import 'package:nova/features/home/views/widgets/icon_button.dart';
import 'package:nova/features/home/views/widgets/product_card.dart';
import 'package:nova/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final hPadding = calcPadding(context);

    return Scaffold(
      backgroundColor: AppColors.primShadow,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(S.of(context).nova, style: AppTextStyle.h1),
        backgroundColor: AppColors.primColor,
        actions: [
          IconButtonW(iconData: Icons.search_outlined, onPressed: () {}),
          IconButtonW(iconData: Icons.settings_outlined, onPressed: () {}),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is ProductsSuccess) {
            final List<ProductModel> products = state.products;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              child: RefreshIndicator(
                backgroundColor: AppColors.primColor,
                color: Colors.white,
                onRefresh: () async {
                  await context.read<HomeCubit>().getProducts();
                },
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(child: SizedBox(height: 15)),
                    SliverGrid.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 170,
                            mainAxisExtent: 270,
                            mainAxisSpacing: 18,
                            crossAxisSpacing: 10,
                          ),
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index]);
                      },
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 10)),
                  ],
                ),
              ),
            );
          } else if (state is ProductsFailure) {
            return ErrorW(
              error: state.failure.message,
              onPressed: () async {
                await context.read<HomeCubit>().getProducts();
              },
            );
          }
          return const Center(child: CircularIndicator());
        },
      ),
    );
  }
}
