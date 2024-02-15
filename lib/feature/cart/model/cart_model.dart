import 'cart_item_model.dart';

final class CartModel {
  double total;
  List<CartItemModel> items;

  CartModel({required this.total, required this.items});
}
