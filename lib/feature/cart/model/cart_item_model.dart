
final class CartItemModel {
  int qty;
  double price;
  double subTotal;
  String image;
  CartItemModel({required this.image,required this.qty, required this.price, required this.subTotal,});

  CartItemModel copyWith({
    int? qty,
    double? price,
    double? subTotal,
    String? image,
  }) {
    return CartItemModel(
      qty: qty ?? this.qty,
      price: price ?? this.price,
      subTotal: subTotal ?? this.subTotal,
      image: image ?? this.image,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItemModel &&
        other.qty == qty &&
        other.price == price &&
        other.subTotal == subTotal &&
        other.image == image;
  }

  @override
  int get hashCode {
    return qty.hashCode ^ price.hashCode ^ subTotal.hashCode ^ image.hashCode;
  }

}