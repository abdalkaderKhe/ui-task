import 'package:flutter/material.dart';
import 'package:flutter_ui_showcase_test/core/component/column/spacer_column.dart';
import 'package:flutter_ui_showcase_test/core/extensions/context_extension.dart';
import '../../../../core/component/row/spacer_row.dart';
import '../../../../core/ui_utilities/decoration/circle_with_shadow_decoration.dart';
import '../../../../core/ui_utilities/decoration/right_border_radius.dart';
import '../../../../core/ui_utilities/decoration/right_shado_ciculer_decoration.dart';
import '../../../../core/ui_utilities/decoration/right_shadow.dart';
import '../../../../product/theme/text_theme.dart';
import '../../model/product.dart';

final class ProductItem extends StatelessWidget {
  final ProductModel productModel;
  const ProductItem({super.key,required this.productModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.spaceMediumValue,
        Row(
          children: [
            Expanded(
              flex: 1,
              child: DecoratedBox(
                decoration: CircleWithShadowDecoration(spreadRadius: 5, blurRadius: 7, opacity: 0.5, x: 0, y: 3, radius: 20,),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    productModel.image.toJPG,
                    height: context.dynamicHeight(0.5),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: context.dynamicHeight(0.4),
                decoration: RightShadowCircularDecoration(
                  rightShadow: RightShadow(opacity: 0.3, spreadRadius: 3, blurRadius: 7, x: 5, y: 0),
                  rightBorderRadius: RightBorderRadius(topRight: 15, bottomRight: 15),
                ),
                child: SpacerRow(
                  spacerFlexValue: 1,
                  bodyFlexValue: 16,
                  child: SpacerColumn(
                    spacerFlexValue: 2,
                    bodyFlexValue: 19,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //const Spacer(flex: 1,),
                        Expanded(
                          flex: 2,
                          child: Text(
                            productModel.title,
                            style: TextThemeApp.instance!.boldTitleLarge(context),
                          ),
                        ),
                        //const Spacer(flex: 1,),
                        Expanded(
                          flex: 2,
                          child: Text(
                            productModel.bucket,
                            style: TextThemeApp.instance!.greyTitleMedium(context),
                          ),
                        ),
                        //const Spacer(flex: 1,),
                        Expanded(
                          flex: 3,
                          child: Text(
                            productModel.price,
                            style: TextThemeApp.instance!.redHeadlineLarge(context),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            productModel.tags.join('  '),
                            style: TextThemeApp.instance!.tagsTextTheme(context),
                          ),
                        ),
                        //const Spacer(flex: 1,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        context.spaceMediumValue,
      ],
    );
  }
}
