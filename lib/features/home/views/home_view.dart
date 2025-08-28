import 'package:flutter/material.dart';
import 'package:nova/core/functions/calc_padding.dart';
import 'package:nova/core/utils/app_colors.dart';
import 'package:nova/core/utils/app_text_style.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverGrid.builder(
              itemCount: 11,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 170,
                mainAxisExtent: 255,
                mainAxisSpacing: 18,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => const ProductCard(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
          ],
        ),
      ),
    );
  }
}
