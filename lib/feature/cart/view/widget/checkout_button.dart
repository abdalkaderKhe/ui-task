import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ui_showcase_test/core/extensions/context_extension.dart';
import 'package:flutter_ui_showcase_test/product/component/button/main_button.dart';
import '../../../../core/component/column/spacer_column.dart';
import '../../../../core/component/row/spacer_row.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/state/cart_state.dart';

final class CheckOutButton extends StatelessWidget {
  const CheckOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.12),
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
          ),
          child: SpacerRow(
            spacerFlexValue: 1,
            bodyFlexValue: 20,
            child: SpacerColumn(
              spacerFlexValue: 2,
              bodyFlexValue: 20,
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Checkout Price',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400)),
                        Text(
                          'Rc . ${CheckoutTotalState.of(context).cartModel.total}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  context.spaceMediumValue,
                  Expanded(
                      flex: 8,
                      child: SizedBox(
                        width: double.infinity,
                        child: MainButton(
                            text: 'Checkout',
                            onTap: () {
                              CartViewModel().showVerifyDialog(context);
                            }),
                      )),
                  context.spaceMediumValue,
                ],
              ),
            ),
          )),
    );
  }
}
