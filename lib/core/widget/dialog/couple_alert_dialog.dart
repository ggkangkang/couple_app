import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class CoupleAlertDialog extends StatelessWidget {
  const CoupleAlertDialog({super.key, required this.title, this.content});

  final String title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content != null ? Text(content!) : null,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
            onPressed: () {
              QuickAlert.show(context: context, type: QuickAlertType.confirm);
            },
            child: const Text('Cancel')),
        const SizedBox(height: 20, child: VerticalDivider()),
        TextButton(onPressed: () {}, child: const Text('Confirm'))
      ],
    );
  }
}

class CoupleAlertDialogs {
  static Future show({
    required BuildContext context,
    required CoupleAlertDialogType type,
    String? title,
    String? text,
    String confirmButtonText = 'Confirm',
    String cancelButtonText = 'Canecel',
    void Function()? onConfirmBtnTap,
    void Function()? onCancelBtnTap,
    Duration? autoCloseDuration,
  }) async {
    // Timer? timer;
    // if (autoCloseDuration != null) {
    //   timer = Timer(autoCloseDuration, () {
    //     Navigator.of(context, rootNavigator: true).pop();
    //   });
    // }
    Widget? dialog;
    //success dialog
    if (type == CoupleAlertDialogType.success) {
      dialog = AlertDialog(
        title: Text(title ?? 'Success'),
        content: Text(text ?? 'Process successfully'),
        actions: [
          TextButton(onPressed: onConfirmBtnTap, child: Text(confirmButtonText))
        ],
      );
    }

    //confirm dialog

    //warning dialog

    //loading

    return showDialog(context: context, builder: (context) => dialog!);
  }
}

enum CoupleAlertDialogType {
  success,
  error,
  warning,
  confirm,
  info,
  loading,
  custom
}
