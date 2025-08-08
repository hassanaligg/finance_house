import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum AlertType { success, error, warning, info }

final Map<AlertType, Color> toastColors = {
  AlertType.success: Colors.green,
  AlertType.error: Colors.red,
  AlertType.warning: Colors.orange,
  AlertType.info: Colors.blue,
};

void showToast({
  required String message,
  required AlertType type,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: toastColors[type],
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showSnackBar({
  required BuildContext context,
  required String message,
  required AlertType type,
  int durationInSeconds = 3,
}) {

  final icons = {
    AlertType.success: Icons.check_circle_outline,
    AlertType.error: Icons.error_outline,
    AlertType.warning: Icons.warning_amber_outlined,
    AlertType.info: Icons.info_outline,
  };

  final snackBar = SnackBar(
    duration: Duration(seconds: durationInSeconds),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(16.0),
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: toastColors[type],
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                icons[type],
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
