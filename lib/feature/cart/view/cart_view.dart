import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ui_showcase_test/feature/cart/view/widget/cart_product_item.dart';
import 'package:flutter_ui_showcase_test/feature/cart/view/widget/checkout_button.dart';
import '../../../product/theme/color_scheme.dart';
import '../view_model/cart_view_model.dart';
import '../view_model/state/cart_state.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemeApp.instance!.grayLight,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'My Cart',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // In this case, it rebuild most widgets
      // If we add new widgets later,
      // it will rebuild only the current widgets without the need to rebuild the new widgets,
      // and the card screen will be preserved as stateless.
      body: CartStateWidget(
        child: Builder(
          builder: (BuildContext context) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: CheckoutTotalState.of(context).cartModel.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartProductItem(
                        index: index,
                      );
                    },
                  ),
                ),
                const CheckOutButton(),
              ],
            );
          },
        ),
      ),
    );
  }
}
