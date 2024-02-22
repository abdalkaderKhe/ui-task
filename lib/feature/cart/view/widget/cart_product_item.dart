import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ui_showcase_test/core/extensions/context_extension.dart';
import '../../../../core/component/column/spacer_column.dart';
import '../../../../core/component/row/spacer_row.dart';
import '../../../../core/ui_utilities/decoration/border_radius_left.dart';
import '../../../../core/ui_utilities/decoration/circle_with_shadow_decoration.dart';
import '../../../../product/theme/text_theme.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/state/cart_state.dart';

final class CartProductItem extends StatelessWidget {
  final int index;
  const CartProductItem({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.spaceMediumValue,
        SpacerRow(
          spacerFlexValue: 1,
          bodyFlexValue: 25,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
            [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadiusLeft(20),
                  child: Image.asset(
                    height: context.dynamicHeight(0.22),
                    CartViewModel().cartModel.items[index].image.toJPG,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: context.dynamicHeight(0.22),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: SpacerColumn(
                    spacerFlexValue: 1,
                    bodyFlexValue: 15,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Text(
                                'Item ${CheckoutTotalState.of(context).cartModel.items[index].qty}',
                                style: TextThemeApp.instance!.boldTitleMediumTextTheme(context),
                              ),
                              context.widthSpaceMediumValue,
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                'Price:  ',
                                style: Theme.of(context).textTheme.titleMedium!,
                              ),
                              Text(
                                '\$${CheckoutTotalState.of(context).cartModel.items[index].price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                'Sub Total:  ',
                                style: Theme.of(context).textTheme.titleMedium!,
                              ),
                              Text(
                                '\$${CheckoutTotalState.of(context).cartModel.items[index].subTotal}',
                                style: TextThemeApp.instance!
                                    .orangeTitleMediumTextTheme(context)
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(flex:1,child: Text(
                                'Ships Fee',
                                style: TextThemeApp.instance!.orangeTitleMediumTextTheme(context),
                              ),),


                              Expanded(
                                flex:1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: IconButton(
                                        onPressed: () {
                                          CartViewModel().decrement(index,context);
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: DecoratedBox(
                                        decoration: CircleWithShadowDecoration(
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          opacity: 0.2,
                                          x: 0,
                                          y: 3,
                                          radius: 8,
                                        ).copyWith(color: Colors.white),
                                        child: Center(
                                          child: Text(
                                            '${CheckoutTotalState.of(context).cartModel.items[index].qty}',
                                            style: Theme.of(context).textTheme.titleMedium!,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: IconButton(
                                          onPressed: () {
                                            CartViewModel().increment(index,context);
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.green,
                                          )),
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        context.spaceMediumValue,
      ],
    );
  }
}

