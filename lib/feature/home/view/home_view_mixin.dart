import 'package:flutter/material.dart';
import '../../../product/theme/color_scheme.dart';
import '../model/product.dart';

mixin HomeViewMixin {
  final Color homeAppBarBackGroundColor = ColorSchemeApp.instance!.grayLight;
  final List<ProductModel> productsList = [
    const ProductModel(
        title: 'Kappa Valour1',
        tags: ['#Cotton', '#Playster', '#Brandend Design'],
        price: '\$5500',
        bucket: 'Bucket',
        image: 'product_1'),
    const ProductModel(
        title: 'Kappa Valour2',
        tags: ['#Cotton', '#Playster', '#Brandend Design'],
        price: '\$5500',
        bucket: 'Bucket',
        image: 'product_2'),
    const ProductModel(
        title: 'Kappa Valour3',
        tags: ['#Cotton', '#Playster', '#Brandend Design'],
        price: '\$5500',
        bucket: 'Bucket',
        image: 'product_3'),
    const ProductModel(
        title: 'Kappa Valour3',
        tags: ['#Cotton', '#Playster', '#Brandend Design'],
        price: '\$5500',
        bucket: 'Bucket',
        image: 'product_2'),
    const ProductModel(
        title: 'Kappa Valour3',
        tags: ['#Cotton', '#Playster', '#Brandend Design'],
        price: '\$5500',
        bucket: 'Bucket',
        image: 'product_1'),
    const ProductModel(
        title: 'Kappa Valour3',
        tags: ['#Cotton', '#Playster', '#Brandend Design'],
        price: '\$5500',
        bucket: 'Bucket',
        image: 'product_3'),
  ];
}


