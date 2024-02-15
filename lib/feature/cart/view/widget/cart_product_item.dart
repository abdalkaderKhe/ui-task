import 'package:flutter/material.dart';
import 'package:flutter_ui_showcase_test/core/extensions/context_extension.dart';
import '../../../../core/component/column/spacer_column.dart';
import '../../../../core/component/row/spacer_row.dart';
import '../../../../core/ui_utilities/decoration/border_radius_left.dart';
import '../../../../core/ui_utilities/decoration/border_radius_right.dart';
import '../../../../core/ui_utilities/decoration/circle_with_shadow_decoration.dart';
import '../../../../product/theme/text_theme.dart';
import '../../view_model/cart_view_model.dart';

class CartProductItem extends StatefulWidget  {
  final int index;
  const CartProductItem({super.key,required this.index});
  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem>{

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
              _buildProductImage(),
              _buildProductDetails(context),
            ],
          ),
        ),
        context.spaceMediumValue,
      ],
    );
  }

  Expanded _buildProductImage()
  {
    return Expanded(
      flex: 2,
      child: ClipRRect(
        borderRadius: BorderRadiusLeft(20),
        child: Image.asset(
          height: context.dynamicHeight(0.22),
          CartViewModel().cartModel.items[widget.index].image.toJPG,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Expanded _buildProductDetails(BuildContext context)
  {
    return Expanded(
      flex: 3,
      child: Container(
        height: context.dynamicHeight(0.22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusRight(20),
        ),
        child: SpacerColumn(
          spacerFlexValue: 1,
          bodyFlexValue: 10,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
            [
              _buildItemCountWidget(context,10),
              _buildPriceText(context,3),
              _buildSubTotalText(context,4),
               context.expandedSpace,
              _buildShipsFeeText(context,5),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildItemCountWidget(BuildContext context,int flex)
  {
    return Expanded(flex: flex,child: Row(
      children: [
        Text('Item ${CartViewModel().cartModel.items[widget.index].qty}',
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
    ),);
  }

  Expanded _buildPriceText(BuildContext context,int flex)
  {
    return Expanded(flex: flex,child: Row(
      children: [
        Text('Price:  ',style:  Theme.of(context)
            .textTheme
            .titleMedium!,),
        Text('\$${CartViewModel().cartModel.items[widget.index].price}',style:Theme.of(context)
            .textTheme
            .titleMedium!.copyWith(fontWeight: FontWeight.w300),),
      ],
    ),);
  }

  Expanded _buildSubTotalText(BuildContext context,int flex)
  {
    return  Expanded(flex: flex,child: Row(
      children: [
         Text('Sub Total:  ',style: Theme.of(context)
            .textTheme
            .titleMedium!,),
        Text(
          '\$${CartViewModel().cartModel.items[widget.index].subTotal}',
          style: TextThemeApp.instance!.orangeTitleMediumTextTheme(context).copyWith(fontWeight: FontWeight.w300),
        ),
      ],
    ),);
  }

  Expanded _buildShipsFeeText(BuildContext context,int flex)
  {
    return Expanded(
      flex: flex,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex:3,child: Text(
            'Ships Fee',
            style: TextThemeApp.instance!.orangeTitleMediumTextTheme(context),
          ),),
          context.expandedSpace,
          Expanded(
            flex:4,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          CartViewModel().decrement(widget.index);
                          CartViewModel().updateCheckoutTotal(context);
                        });
                      },
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.red,
                      ),
                  ),
                ),
                Expanded(
                  flex: 2,
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
                          '${CartViewModel().cartModel.items[widget.index].qty}',
                          style: Theme.of(context).textTheme.titleMedium!,
                        ),
                      ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          CartViewModel().increment(widget.index);
                          CartViewModel().updateCheckoutTotal(context);
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.green,
                      )),
                ),
                context.expandedSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
