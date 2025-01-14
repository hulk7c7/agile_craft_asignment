

import 'dart:developer';

import 'package:agile_craft_asignment/utils/globalWidgets.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

abstract class GlobalFunctions {

  static bool willPrint = true;

  static Future<bool> internetIsConnected(BuildContext context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    bool connected =
    connectivityResult == ConnectivityResult.none ? false : true;
    if(!connected) {
      showCustomSnackBar(
        context: context,
        title: 'No Internet Connection!',
        message: "Please check your internet connection.",
        contentType: ContentType.failure,
      );
    }
    return connected;
  }

  static void cPrint(dynamic object) { if(willPrint) print(object); }

  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

}