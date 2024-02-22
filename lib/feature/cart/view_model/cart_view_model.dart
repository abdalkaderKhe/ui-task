import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_showcase_test/feature/cart/view_model/state/cart_state.dart';
import '../../../product/component/dialgo/verify_dialog.dart';
import '../model/cart_item_model.dart';
import '../model/cart_model.dart';

abstract class CartViewModelBase {
  void increment(int index,BuildContext context);

  void decrement(int index,BuildContext context);

  void showVerifyDialog(BuildContext context);

  //void updateCheckoutTotal(BuildContext context);

  void delete(int index,BuildContext context);
}

class CartViewModel extends CartViewModelBase {
  static final CartViewModel _instance = CartViewModel._internal();

  CartViewModel._internal();

  factory CartViewModel() {
    return _instance;
  }

  CartModel cartModel = CartModel(
    total: 600,
    items: [
      CartItemModel(qty: 1, price: 50, subTotal: 50, image: 'product_1',),
      CartItemModel(qty: 1, price: 200, subTotal: 200, image: 'product_2'),
      CartItemModel(qty: 1, price: 100, subTotal: 100, image: 'product_3'),
      CartItemModel(qty: 1, price: 50, subTotal: 50, image: 'product_1'),
      CartItemModel(qty: 1, price: 200, subTotal: 200, image: 'product_2'),
    ],
  );


  @override
  increment(int index,BuildContext context) {
    cartModel.items[index].subTotal = cartModel.items[index].subTotal + cartModel.items[index].price;
    cartModel.items[index].qty++;
    cartModel.total = cartModel.total + cartModel.items[index].price;
    CheckoutTotalState.of(context).update(cartModel);
  }

  @override
  decrement(int index,BuildContext context) {
    if (cartModel.items[index].qty != 1)
    {
      cartModel.items[index].subTotal = cartModel.items[index].subTotal - cartModel.items[index].price;
      cartModel.items[index].qty--;
      cartModel.total = cartModel.total - cartModel.items[index].price;
      CheckoutTotalState.of(context).update(cartModel);
    }
    else
    {
      delete(index,context);
    }

  }

  @override
  void showVerifyDialog(BuildContext context) {
    VerifyDialog(context: context).show();
  }

  @override
  //void updateCheckoutTotal(BuildContext context) {CheckoutTotalState.of(context).updateTotalValue();}

  @override
  void delete(int index,BuildContext context) {
    cartModel.total = cartModel.total - cartModel.items[index].price;
    cartModel.items.removeAt(index);
    CheckoutTotalState.of(context).update(cartModel);
  }
}
