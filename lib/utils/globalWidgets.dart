

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

Widget customTextFormField({
  required String labelText,
  required IconData prefixIcon,
  int maxLines = 1,
  TextInputType keyboardType = TextInputType.text,
  required Function(String) onChanged,
  double borderRadius = 10.0,
  bool obscureText = false,
}) {
  return TextFormField(
    maxLines: maxLines,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      prefixIcon: Icon(prefixIcon),
    ),
    onChanged: onChanged,
  );
}


Widget customElevatedButton({
  required String text,
  required VoidCallback onPressed,
  double width = double.infinity,
  double height = 50.0,
  double borderRadius = 10.0,
  Color backgroundColor = Colors.green,
  TextStyle textStyle = const TextStyle(fontSize: 18, color: Colors.white),
}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: backgroundColor,
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    ),
  );
}


void showCustomSnackBar({
  required BuildContext context,
  required String title,
  required String message,
  required ContentType contentType,
  Color backgroundColor = Colors.transparent,
  bool inMaterialBanner = true,
  SnackBarBehavior behavior = SnackBarBehavior.floating,
  double elevation = 0,
}) {
  final snackBar = SnackBar(
    elevation: elevation,
    backgroundColor: backgroundColor,
    behavior: behavior,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: contentType,
      inMaterialBanner: inMaterialBanner,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}