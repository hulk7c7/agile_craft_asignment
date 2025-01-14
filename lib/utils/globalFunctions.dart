

import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

abstract class GlobalFunctions {

  static bool willPrint = true;

  static Future<bool> internetIsConnected() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    bool connected =
    connectivityResult == ConnectivityResult.none ? false : true;
    return connected;
  }

  static void cPrint(dynamic object) { if(willPrint) print(object); }

  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

}