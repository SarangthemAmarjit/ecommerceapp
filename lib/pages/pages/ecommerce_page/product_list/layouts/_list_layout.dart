import 'package:ecommerceapp/pages/view/landing/controller/landing_controller.dart';
import 'package:ecommerceapp/pages/view/landing/controller/productcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '/providers/_ecommerce_product_list_provider.dart';
import '../../components/product_cards/product_cards.dart' as g_comp;

class ProductsListLayout extends StatelessWidget {
  const ProductsListLayout({super.key, this.padding});
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    LandingController lancon = Get.put(LandingController());
    Productcontroller procon = Get.put(Productcontroller());
    return Consumer<ECommerceMockProductsNotifier>(
      builder: (context, prov, child) {
        return ListView.separated(
          padding: padding,
          shrinkWrap: true,
          primary: false,
          itemCount: prov.fakeApiProducts.length,
          itemBuilder: (context, index) {
            final _product = prov.fakeApiProducts[index];

            return g_comp.LisTileProductCard(
              product: _product,
              isFavorite: prov.favoriteProducts.contains(_product.id),
              onFavoriteTap: () => prov.addToFav(_product.id),
              onAddCartTap: () {
                procon.addToCart(_product.id);
              },
              onTap: () => lancon.setcurrentpage('productdetails'),
            );
          },
          separatorBuilder: (c, i) => const SizedBox(height: 20),
        );
      },
    );
  }
}
