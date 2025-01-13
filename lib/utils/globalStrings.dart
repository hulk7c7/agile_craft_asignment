import 'package:agile_craft_asignment/backend/localDB/localStorage.dart';
import 'package:agile_craft_asignment/utils/globalFunctions.dart';

abstract class GlobalStrings {

 static dynamic loginHeader = {
    'Content-Type': 'application/json',
    'Abp.TenantId': '10'
  };

 static dynamic header = {
   'Abp.TenantId': '10',
   'Authorization': 'Bearer ${GetUserLocalStorageV2().accessToken()}',
 };



}