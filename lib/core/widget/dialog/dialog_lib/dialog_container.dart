import 'package:coupple_app/core/widget/dialog/dialog_lib/dialog_type.dart';
import 'package:flutter/material.dart';

class QubitDialogContainer extends StatelessWidget {
  const QubitDialogContainer({super.key, this.options});

  final QubitAlertDialogOptions? options;

  @override
  Widget build(BuildContext context) {
    final header = buildHeader(context);
    final button = buildButtons();
    final title = buildTitle(context);
    final text = buildText(context);

    return Container(
      decoration: BoxDecoration(
        color: options!.backgroundColor,
        borderRadius: BorderRadius.circular(options!.borderRadius!),
      ),
      clipBehavior: Clip.antiAlias,
      width: options!.width ?? MediaQuery.of(context).size.shortestSide,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //const Icon(Icons.close),
          header,
          title,
          text,

          button
        ],
      ),
    );
  }

  Widget buildHeader(context) {
    final headerBackgroundColor =
        options!.headerBackgroundColor ?? whatColor(context);
    final icon = whatIcon();
    return Container(
      decoration: BoxDecoration(
          color: headerBackgroundColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      //color: Colors.red[50],
      //height: 100,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close))),
          icon!,
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Widget buildText(context) {
    if (options!.text == null ||
        options!.type == QubitAlertDialogType.loading) {
      return Container(
        height: 30,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
        child: Text(
          textAlign: TextAlign.center,
          options!.text ?? '',
          style: const TextStyle(color: Colors.grey),
        ),
      );
    }
  }

  Widget buildTitle(context) {
    final title = options!.title ?? whatTitle();
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 10, 5),
      child: Text(
        textAlign: TextAlign.center,
        title!,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildButtons() {
    if (options!.type == QubitAlertDialogType.loading ||
        (!options!.showCancelBtn!) && (!options!.showConfirmBtn!)) {
      return Container();
    } else {
      return SizedBox(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///
            if (options!.showCancelBtn!)
              TextButton(
                  onPressed: options!.onCancelBtnTap,
                  child: Text(options!.cancelBtnText!)),

            /// the divider between button is only will show when show confirm and cancel button is test as true
            if (options!.showConfirmBtn == true &&
                options!.showCancelBtn == true)
              const VerticalDivider(
                indent: 15,
                endIndent: 15,
              ),

            ///
            if (options!.showConfirmBtn!)
              TextButton(
                  onPressed: options!.onConfirmBtnTap,
                  child: Text(options!.confirmBtnText!)),
          ],
        ),
      );
    }
  }

  String? whatTitle() {
    switch (options!.type) {
      case QubitAlertDialogType.error:
        return 'Error';
      case QubitAlertDialogType.confirm:
        return 'Are you sure?';
      case QubitAlertDialogType.warning:
        return 'Warning';
      case QubitAlertDialogType.success:
        return 'Success';
      case QubitAlertDialogType.loading:
        return 'Loading';
      case QubitAlertDialogType.info:
        return 'Info';
      default:
        return null;
    }
  }

  Color? whatColor(context) {
    switch (options!.type) {
      case QubitAlertDialogType.error:
        return Colors.red[50];
      case QubitAlertDialogType.confirm:
        return Colors.green[50];
      case QubitAlertDialogType.warning:
        return Colors.amber[50];
      case QubitAlertDialogType.success:
        return Colors.green[50];
      case QubitAlertDialogType.loading:
        return Theme.of(context).colorScheme.primary;
      case QubitAlertDialogType.info:
        return Colors.blue[50];
      default:
        return null;
    }
  }

  Widget? whatIcon() {
    double iconSize = 60;
    switch (options!.type) {
      case QubitAlertDialogType.error:
        return Icon(
          Icons.error_outline,
          size: iconSize,
          color: Colors.red,
        );
      case QubitAlertDialogType.confirm:
        return Icon(
          Icons.question_mark,
          size: iconSize,
          color: Colors.green,
        );
      case QubitAlertDialogType.warning:
        return Icon(
          Icons.error_outline_sharp,
          size: iconSize,
          color: Colors.amber,
        );
      case QubitAlertDialogType.success:
        return Icon(
          Icons.check_circle_outline_outlined,
          size: iconSize,
          color: Colors.green,
        );
      case QubitAlertDialogType.loading:
        return const CircularProgressIndicator();
      case QubitAlertDialogType.info:
        return Icon(
          Icons.info_outlined,
          size: iconSize,
          color: Colors.blue,
        );
      default:
        return null;
    }
  }
}
