import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_ui_showcase_test/core/component/column/spacer_column.dart';
import 'package:flutter_ui_showcase_test/core/component/row/spacer_row.dart';
import 'package:flutter_ui_showcase_test/core/extensions/context_extension.dart';
import 'package:flutter_ui_showcase_test/product/component/button/main_button.dart';

import '../../constants/texts.dart';

class VerifyDialog{
  final BuildContext context;
  VerifyDialog({required this.context});

  void show() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: context.dynamicHeight(0.2),
            width: context.dynamicWidth(0.2),
            child: Center(child: _body(),),
          ),
        );
      },
    );
  }

  SpacerRow _body() {
    return SpacerRow(
      spacerFlexValue: 2,
      bodyFlexValue: 10,
      child: SpacerColumn(
        spacerFlexValue: 2,
        bodyFlexValue: 2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            _buildConfirmButton(),
             context.expandedSpace,
            _buildCloseButton(),
          ],
        ),
      ),
    );
  }

  Expanded _buildConfirmButton() {
    return Expanded(
      flex: 2,
      child: MainButton(
          text: 'Confirm',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(TextsConstants.successMessage),
            ));
            context.pop();
          }),
    );
  }

  Expanded _buildCloseButton() {
    return Expanded(
      flex: 2,
      child: MainButton(
          text: 'Close',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(TextsConstants.errorMessage),
            ));
            context.pop();
          }),
    );
  }
}

