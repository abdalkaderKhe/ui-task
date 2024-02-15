import 'package:flutter/cupertino.dart';
@immutable
final class ProductModel {
  final String title;
  final List<String> tags;
  final String price;
  final String bucket;
  final String image;

  const ProductModel(
      {required this.title,
      required this.tags,
      required this.price,
      required this.bucket,
      required this.image});
}
