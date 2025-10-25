import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import '/providers/providers.dart';
import 'components/_components.dart' as comp;
import 'layouts/layouts.dart' as layout;

class ProductListViewDesk extends StatefulWidget {
  const ProductListViewDesk({super.key});

  @override
  State<ProductListViewDesk> createState() => _ProductListViewDeskState();
}

class _ProductListViewDeskState extends State<ProductListViewDesk> {
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

  // Pagination Data
  int showPerPage = 10;
  int currentPage = 1;

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

    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 211, 246, 212),
          width: mqSize.width,
          height: 60,
        ),
        ResponsiveGridRow(
          children: [
            if (isDesktop)
              ResponsiveGridCol(
                lg: 2,
                md: mqSize.width < 992 ? null : 3,
                child: Expanded(
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
                      perPage: showPerPage,
                      onPerpageChange: (v) {
                        if (currentPage > comp.PaginationWidget.pageCount) {
                          setState(
                            () =>
                                currentPage = comp.PaginationWidget.pageCount,
                          );
                        }
                        productListProv.loadProductsForPage(currentPage, v!);
                        setState(() => showPerPage = v);
                      },
                      filterId: filterId,
                      onFilterChange: (v) => setState(() => filterId = v!),
                    ),
        
                    // Products
                    switch (currentLayout) {
                      comp.ProductLayoutType.grid ||
                      comp.ProductLayoutType.border =>
                        layout.ProductsGridLayout(
                          showBorder:
                              currentLayout == comp.ProductLayoutType.border,
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
                          currentPage: currentPage,
                          totalItem: productListProv.totalProducts,
                          perPage: showPerPage,
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
      ],
    );
  }

  void _handlePageChange(int page, ECommerceMockProductsNotifier notifier) {
    notifier.loadProductsForPage(page, showPerPage);
    setState(() => currentPage = page);
    scrollToTop();
  }
}
