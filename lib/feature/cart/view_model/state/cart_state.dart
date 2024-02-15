import 'package:flutter/material.dart';
import 'package:flutter_ui_showcase_test/feature/cart/view_model/cart_view_model.dart';

class CartStateWidget extends StatefulWidget {
  final Widget child;
  const CartStateWidget({super.key,required this.child});
  @override
  State<CartStateWidget> createState() => _CartStateWidgetState();
}

class _CartStateWidgetState extends State<CartStateWidget> {
  double total = CartViewModel().cartModel.total;

  void updateTotalValue()
  {
    setState(() {
      total = CartViewModel().cartModel.total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckoutTotalState(
      total: total,
      state: this,
      child: widget.child,
    );
  }
}

class CheckoutTotalState extends InheritedWidget{
  final double total;
  final _CartStateWidgetState state;
  const CheckoutTotalState({super.key, required super.child,required this.total,required this.state,});
  @override
  bool updateShouldNotify(covariant CheckoutTotalState oldWidget) {
    return total != oldWidget.total;
  }
  static _CartStateWidgetState of(BuildContext context)  => context.dependOnInheritedWidgetOfExactType<CheckoutTotalState>()!.state;

}
