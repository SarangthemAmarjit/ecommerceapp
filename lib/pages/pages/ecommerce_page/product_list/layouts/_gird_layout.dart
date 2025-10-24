import 'package:ecommerceapp/pages/view/landing/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '/providers/_ecommerce_product_list_provider.dart';
import '../../components/components.dart';

class ProductsGridLayout extends StatelessWidget {
  const ProductsGridLayout({super.key, this.showBorder = false, this.padding});
  final bool showBorder;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    LandingController lancon = Get.put(LandingController());
    return Consumer<ECommerceMockProductsNotifier>(
      builder: (context, prov, child) {
        return GridView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: prov.fakeApiProducts.length,
          padding: padding,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: mqSize.width < 480
                ? 500
                : (showBorder ? 310 : 340),
            mainAxisExtent: 505,
            childAspectRatio: 0.6,
            mainAxisSpacing: showBorder ? 0 : 16,
            crossAxisSpacing: showBorder ? 0 : 16,
          ),
          itemBuilder: (context, index) {
            final product = prov.fakeApiProducts[index];
            return Container(
              decoration: BoxDecoration(
                border: !showBorder
                    ? null
                    : Border.all(
                        color: theme.colorScheme.outline,
                        width: 1.5,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
              ),
              child: GridProductCard(
                product: product,
                showHoverEffect: !showBorder,
                isFavorite: prov.favoriteProducts.contains(product.id),
                onFavoriteTap: () => prov.addToFav(product.id),
                onAddCartTap: () {},
                onTap: () => lancon.setcurrentpage('productdetails'),
              ),
            );
          },
        );
      },
    );
  }
}
