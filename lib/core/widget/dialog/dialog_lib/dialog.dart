import 'package:coupple_app/core/widget/dialog/dialog_lib/dialog_container.dart';
import 'package:coupple_app/core/widget/dialog/dialog_lib/dialog_type.dart';
import 'package:flutter/material.dart';

class QubitAlertDialog {
  static Future<void> show({
    required BuildContext context,
    required QubitAlertDialogType type,
    String? title,
    String? text,
    String? confirmButtonText = 'Confirm',
    String? cancelButtonText = 'Cancel',
    void Function()? onConfirmBtnTap,
    void Function()? onCancelBtnTap,
    bool? showConfirmButton = false,
    bool? showCancelButton = false,

    /// Background Color for dialog
    Color backgroundColor = Colors.white,

    /// Header Background Color for dialog
    Color? headerBackgroundColor,

    /// Dialog Border Radius
    double borderRadius = 15.0,
  }) async {
    QubitAlertDialogOptions option = QubitAlertDialogOptions(
      type: type,
      text: text,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      headerBackgroundColor: headerBackgroundColor,
      showCancelBtn: showCancelButton,
      showConfirmBtn: showConfirmButton,
      onCancelBtnTap: onCancelBtnTap,
      onConfirmBtnTap: onConfirmBtnTap,
      cancelBtnText: cancelButtonText,
      confirmBtnText: confirmButtonText,
    );

    Widget dialog = AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: QubitDialogContainer(
        options: option,
      ),
    );

    return showDialog(context: context, builder: (context) => dialog);
  }
}
