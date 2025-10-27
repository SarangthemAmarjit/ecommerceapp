import 'package:ecommerceapp/pages/pages/ecommerce_page/product_list/info.dart';
import 'package:ecommerceapp/pages/view/landing/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '/providers/providers.dart';
import 'components/_components.dart' as comp;
import 'layouts/layouts.dart' as layout;

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  comp.ProductLayoutType currentLayout = comp.ProductLayoutType.grid;
  late final scrollController = ScrollController();
  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: Durations.medium3,
      curve: Curves.easeInToLinear,
    );
  }



  int filterId = 1;


  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productListProv = Provider.of<ECommerceMockProductsNotifier>(context);

    final theme = Theme.of(context);
    final mqSize = MediaQuery.sizeOf(context);
    final isDesktop = mqSize.width >= 992;

    final padding = responsiveValue<double>(
      context,
      xs: 16,
      md: isDesktop ? 24 : 16,
      lg: 24,
    );

    final innerPadding = responsiveValue<EdgeInsetsGeometry?>(
      context,
      xs: EdgeInsetsDirectional.symmetric(vertical: padding),
      md: isDesktop
          ? EdgeInsetsDirectional.fromSTEB(padding, padding, 0, 0)
          : null,
    );
    LandingController lancon = Get.put(LandingController());
    return Column(
      children: [
        InfoBar(
          ontapclosebutton: () {
            lancon.setcurrentpage('landing');
          },
        ),
        SizedBox(
          height: mqSize.height,
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 248, 247, 242),
            key: scaffoldKey,
            drawer: isDesktop
                ? null
                : const Drawer(
                    shape: RoundedRectangleBorder(),
                    child: SingleChildScrollView(child: comp.FilterSidebar()),
                  ),
            body: SingleChildScrollView(
              controller: scrollController,
              child: ResponsiveGridRow(
                children: [
                  if (isDesktop)
                    ResponsiveGridCol(
                      lg: 2,
                      md: mqSize.width < 992 ? null : 3,
                      child: Container(
                        margin: EdgeInsetsDirectional.only(
                          start: padding / 2.5,
                          bottom: padding / 2.5,
                          top: padding / 2.5,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(4),
                            bottomStart: Radius.circular(4),
                            bottomEnd: Radius.circular(4),
                          ),
                          border: currentLayout != comp.ProductLayoutType.border
                              ? null
                              : Border.all(color: theme.colorScheme.outline),
                        ),
                        child: const comp.FilterSidebar(),
                      ),
                    ),

                  // Product List
                  ResponsiveGridCol(
                    lg: 10,
                    md: mqSize.width < 992 ? null : 9,
                    child: Padding(
                      padding: isDesktop
                          ? EdgeInsetsDirectional.fromSTEB(
                              0,
                              0,
                              padding / 2.5,
                              padding / 2.5,
                            )
                          : EdgeInsets.all(padding / 2.5),
                      child: Column(
                        children: [
                          SizedBox(height: padding / 2.5),
                          comp.Topbar(
                            scaffoldKey: scaffoldKey,
                            showDesktop: isDesktop,
                            selectedLayout: currentLayout,
                            onLayoutSelect: (value) =>
                                setState(() => currentLayout = value),
                            perPage: productListProv.showPerPage,
                            onPerpageChange: (v) {
                         
                              productListProv.setShowPerPage(v!);
                            
                            },
                            filterId: filterId,
                            onFilterChange: (v) =>
                                setState(() => filterId = v!),
                          ),

                          // Products
                          switch (currentLayout) {
                            comp.ProductLayoutType.grid ||
                            comp.ProductLayoutType.border =>
                              layout.ProductsGridLayout(
                                showBorder:
                                    currentLayout ==
                                    comp.ProductLayoutType.border,
                                padding: innerPadding,
                              ),
                            comp.ProductLayoutType.tile =>
                              layout.ProductsListLayout(padding: innerPadding),
                          },
                          const SizedBox(height: 24),

                          // Pagination
                          SizedBox(
                            width: double.maxFinite,
                            child: Align(
                              child: comp.PaginationWidget(
                                currentPage: productListProv.currentPage,
                                totalItem: productListProv.totalProducts,
                                perPage: productListProv.showPerPage,
                                onPagePress: (page) =>
                                    _handlePageChange(page, productListProv),
                                onNextPressed: (page) =>
                                    _handlePageChange(page, productListProv),
                                onPreviousPressed: (page) =>
                                    _handlePageChange(page, productListProv),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handlePageChange(int page, ECommerceMockProductsNotifier notifier) {
   notifier.setCurrentPage(page);
    scrollToTop();
  }
}
