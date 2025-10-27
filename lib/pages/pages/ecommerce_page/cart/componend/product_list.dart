// 🐦 Flutter imports:
// 📦 Package imports:
import 'package:ecommerceapp/pages/view/landing/controller/productcontroller.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '/core/generated/l10n.dart' as l;
// 🌎 Project imports:
import '/core/theme/_app_colors.dart';
import '/widgets/widgets.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final lang = l.S.of(context);
    Productcontroller procon = Get.put(Productcontroller());

    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          child: ShadowContainer(
            clipBehavior: Clip.none,
            contentPadding: EdgeInsets.zero,
            showHeader: false,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return procon.cartproducts.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'No products in the cart.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: Theme(
                            data: theme.copyWith(
                              dividerColor: theme.colorScheme.outline,
                              checkboxTheme: const CheckboxThemeData(
                                side: BorderSide(
                                  color: AcnooAppColors.kNeutral500,
                                  width: 1.0,
                                ),
                              ),
                              dividerTheme: DividerThemeData(
                                color: theme.colorScheme.outline,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primaryContainer,
                                borderRadius: BorderRadiusDirectional.circular(
                                  8.0,
                                ),
                                border: Border.all(
                                  color: theme.colorScheme.outline,
                                  width: 1.0,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadiusDirectional.circular(
                                  8.0,
                                ),
                                child: DataTable(
                                  dataRowMaxHeight: 90,
                                  border: TableBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    horizontalInside: BorderSide(
                                      color: theme.colorScheme.outline,
                                    ),
                                  ),
                                  dividerThickness: 1.0,
                                  horizontalMargin: 30.0,
                                  headingRowColor: WidgetStateProperty.all(
                                    theme.colorScheme.surface,
                                  ),
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        '${lang.SL}.',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        textAlign: TextAlign.center,
                                        lang.name,
                                        //'Name',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        lang.price,
                                        // 'Price',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        lang.quantity,
                                        //'Quantity',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        lang.subtotal,
                                        //'Subtotal',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        lang.action,
                                        //'Action',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                  rows: procon.cartproducts.map((user) {
                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Row(
                                            children: [
                                              Text(
                                                user.id.toString(),
                                                style: textTheme.titleSmall
                                                    ?.copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                              const SizedBox(width: 20),
                                              Image.asset(
                                                user.image,
                                                width: 70,
                                                height: 70,
                                              ),
                                            ],
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            user.name,
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            '\$${user.price.toStringAsFixed(2)}',
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ),
                                        const DataCell(
                                          SizedBox(
                                            width: 140,
                                            child: CounterField(),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            '\$${user.subtotal.toStringAsFixed(2)}',
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ),
                                        DataCell(
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  FeatherIcons.edit3,
                                                  color:
                                                      AcnooAppColors.kSuccess,
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  FeatherIcons.trash2,
                                                  color: AcnooAppColors.kError,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Product {
  final int id;
  final String image;
  final String name;
  final double price;
  int quantity;
  final double subtotal;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.subtotal,
  });
}
