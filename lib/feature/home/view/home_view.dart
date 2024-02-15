import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_ui_showcase_test/core/component/column/spacer_column.dart';
import 'package:flutter_ui_showcase_test/core/extensions/context_extension.dart';
import 'package:flutter_ui_showcase_test/feature/home/view/widget/product_item.dart';
import 'package:flutter_ui_showcase_test/product/component/field/search_field.dart';
import '../../../core/component/row/spacer_row.dart';
import '../../../product/theme/text_theme.dart';
import 'home_view_mixin.dart';

final class HomeView extends StatelessWidget with HomeViewMixin {
  HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildHeader(context),
          _buildContentRow(context),
          _buildBody(context),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: homeAppBarBackGroundColor,
      automaticallyImplyLeading: false,
      title: const Text('Shopping'),
      centerTitle: true,
      leading: const Icon(Icons.dehaze),
      actions: _appBarActionList(context),
      elevation: 0,
    );
  }

  List<Widget> _appBarActionList(BuildContext context) {
    return [
      const Icon(Icons.vertical_distribute),
      context.spaceLowValue,
      IconButton(
          onPressed: () {
            context.push(context.namedLocation('cart'));
          },
          icon: const Icon(Icons.shopping_cart_rounded)),
      context.spaceLowValue,
    ];
  }

  SizedBox _buildHeader(BuildContext context) {
    return SizedBox(
      height: context.lowValue,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: homeAppBarBackGroundColor,
        ),
        child: SpacerRow(
          spacerFlexValue: 1,
          bodyFlexValue: 18,
          child: SpacerColumn(
            spacerFlexValue: 1,
            bodyFlexValue: 4,
            child: SizedBox(
              height: context.minimalValue,
              child: SearchInputField(),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildContentRow(BuildContext context) {
    return SizedBox(
      height: context.minValue,
      child: SpacerRow(
        spacerFlexValue: 1,
        bodyFlexValue: 17,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Branded Bucket',
                style: TextThemeApp.instance!.greyDarkTitleLarge(context).copyWith(fontWeight: FontWeight.w400)),
            Text('See All',
                style: TextThemeApp.instance!.greyTitleMedium(context)),
          ],
        ),
      ),
    );
  }

  Expanded _buildBody(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
          children: productsList.map((item) {
        return SpacerRow(
            spacerFlexValue: 1,
            bodyFlexValue: 40,
            child: ProductItem(
              productModel: item,
            ));
      }).toList()),
    ));
  }
}
