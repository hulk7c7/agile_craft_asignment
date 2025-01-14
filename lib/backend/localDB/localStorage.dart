import 'package:agile_craft_asignment/presentation/home/models/product_model.dart';
import 'package:agile_craft_asignment/utils/globalFunctions.dart';
import 'package:hive/hive.dart';

class SetUserLocalStorageV2 {
  final box = Hive.box(UserStorageKey.mainBox);

  storingDataInBox(String key, dynamic v) {
    try {
      box.put(key, v);
    } catch (e, err) {
      GlobalFunctions.cPrint("Got an error ==> $e");
      GlobalFunctions.cPrint('Error stack => $err');
    }
  }

  void isLogin(bool value) => storingDataInBox(UserStorageKey.isLogin, value);

  void userId(String? value) => storingDataInBox(UserStorageKey.userId, value);

  void accessToken(String? value) =>
      storingDataInBox(UserStorageKey.accessToken, value);

  void refreshToken(String? value) =>
      storingDataInBox(UserStorageKey.refreshToken, value);

  void products(List<Products>? value) =>
      storingDataInBox(UserStorageKey.products, value);


  void clearUser() {
    box.delete(UserStorageKey.isLogin);
    box.delete(UserStorageKey.userId);
    box.delete(UserStorageKey.accessToken);
    box.delete(UserStorageKey.refreshToken);
    box.delete(UserStorageKey.products);

  }

  void clear() => box.clear();
}

class GetUserLocalStorageV2 {
  final box = Hive.box(UserStorageKey.mainBox);
  //final box2 = Hive.box(UserStorageKey.affiliationAnalytics);

  bool? isLogin() => box.get(UserStorageKey.isLogin);

  String? accessToken() => box.get(UserStorageKey.accessToken);

  String? userId() => box.get(UserStorageKey.userId);

  String? refreshToken() => box.get(UserStorageKey.refreshToken);

  List<Products>? products() => box.get(UserStorageKey.products);

}

class UserStorageKey {
  static String get mainBox => "agile_crafts";

  static String get isLogin => "isLogin";

  static String get userId => "userId";

  static String get accessToken => "accessToken";

  static String get refreshToken => "refreshToken";

  static String get products => "products";

}
