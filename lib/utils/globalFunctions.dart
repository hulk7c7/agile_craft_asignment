

import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class GlobalFunctions {

  static Future<bool> internetIsConnected() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    bool connected =
    connectivityResult == ConnectivityResult.none ? false : true;
    return connected;
  }

  static void errorPrint(dynamic object) {
    log("", error: '\x1b[41m' + '\x1b[47m' + ' [Error] : $object ' + '\x1b[0m');
  }

}