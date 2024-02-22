import 'package:flutter/foundation.dart';

import 'cart_item_model.dart';

final class CartModel {
  double total;
  List<CartItemModel> items;
  CartModel({required this.total, required this.items,});

  CartModel copyWith({
    double? total,
    List<CartItemModel>? items,
    int? count,
  }) {
    return CartModel(
      total: total ?? this.total,
      items: items ?? this.items,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModel &&
        other.total == total &&
        other.items.length == items.length &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return total.hashCode ^ items.hashCode;
  }
}
