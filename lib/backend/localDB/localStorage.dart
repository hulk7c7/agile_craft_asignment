import 'package:agile_craft_asignment/utils/globalFunctions.dart';
import 'package:hive/hive.dart';

class SetUserLocalStorageV2 {
  final box = Hive.box(UserStorageKey.mainBox);
  //final box2 = Hive.box(UserStorageKey.affiliationAnalytics);

  storingDataInBox(String key, dynamic v) {
    try {
      box.put(key, v);
    } catch (e, err) {
      GlobalFunctions.errorPrint("Got an error ==> $e");
      GlobalFunctions.errorPrint('Error stack => $err');
    }
  }

  void isLogin(String value) => storingDataInBox(UserStorageKey.isLogin, value);

  void userId(String? value) => storingDataInBox(UserStorageKey.userId, value);

  void userNumber(String? value) =>
      storingDataInBox(UserStorageKey.userNumber, value);

  void userEmail(String? value) =>
      storingDataInBox(UserStorageKey.userEmail, value);

  void userName(String? value) =>
      storingDataInBox(UserStorageKey.userName, value);

  void userPhoto(String value) =>
      storingDataInBox(UserStorageKey.userPhoto, value);

  void isVerified(String value) =>
      storingDataInBox(UserStorageKey.isVerified, value);

  void lastUpdated(String value) =>
      storingDataInBox(UserStorageKey.lastUpdated, value);

  void userGender(String value) =>
      storingDataInBox(UserStorageKey.userGender, value);

  void lastLogin(String value) =>
      storingDataInBox(UserStorageKey.lastLogin, value);

  void userThana(String value) =>
      storingDataInBox(UserStorageKey.userThana, value);

  void userAddress(String value) =>
      storingDataInBox(UserStorageKey.userAddress, value);

  void isActive(String value) =>
      storingDataInBox(UserStorageKey.isActive, value);

  void isBloodDooner(String value) =>
      storingDataInBox(UserStorageKey.isBloodDooner, value);

  void isSearchingBlood(String value) =>
      storingDataInBox(UserStorageKey.isSearchingBlood, value);

  void isLFToday(String value) =>
      storingDataInBox(UserStorageKey.isLFToday, value);


  void clearUser() {
    box.delete(UserStorageKey.isLogin);
    box.delete(UserStorageKey.userId);
    box.delete(UserStorageKey.userNumber);
    box.delete(UserStorageKey.userEmail);
    box.delete(UserStorageKey.userName);
    box.delete(UserStorageKey.userPhoto);
    box.delete(UserStorageKey.isVerified);
    box.delete(UserStorageKey.lastUpdated);
    box.delete(UserStorageKey.userGender);
    box.delete(UserStorageKey.lastLogin);
    box.delete(UserStorageKey.userThana);
    box.delete(UserStorageKey.userAddress);
    box.delete(UserStorageKey.isActive);
    box.delete(UserStorageKey.isBloodDooner);
    box.delete(UserStorageKey.isSearchingBlood);
    box.delete(UserStorageKey.isLFToday);
  }

  void clear() => box.clear();
}

class GetUserLocalStorageV2 {
  final box = Hive.box(UserStorageKey.mainBox);
  //final box2 = Hive.box(UserStorageKey.affiliationAnalytics);

  String? isLogin() => box.get(UserStorageKey.isLogin);

  String? userPhoto() => box.get(UserStorageKey.userPhoto);

  String? userId() => box.get(UserStorageKey.userId);

  String? isVerified() => box.get(UserStorageKey.isVerified);

  String? userNumber() => box.get(UserStorageKey.userNumber);

  String? userEmail() => box.get(UserStorageKey.userEmail);

  String? userName() => box.get(UserStorageKey.userName);

  String? lastUpdated() => box.get(UserStorageKey.lastUpdated);

  String? userGender() => box.get(UserStorageKey.userGender);

  String? lastLogin() => box.get(UserStorageKey.lastLogin);

  String? userThana() => box.get(UserStorageKey.userThana);

  String? userAddress() => box.get(UserStorageKey.userAddress);

  String? isActive() => box.get(UserStorageKey.isActive);

  String? isBloodDooner() => box.get(UserStorageKey.isBloodDooner);

  String? isSearchingBlood() => box.get(UserStorageKey.isSearchingBlood);

  String? isLFToday() => box.get(UserStorageKey.isLFToday);


}

class UserStorageKey {
  static String get mainBox => "agile_crafts";

  static String get isLogin => "isLogin";

  static String get userId => "userId";

  static String get userNumber => "userNumber";

  static String get userEmail => "userEmail";

  static String get userName => "userName";

  static String get userPhoto => "userPhoto";

  static String get isVerified => "isVerified";

  static String get lastUpdated => "lastUpdated";

  static String get userGender => "userGender";

  static String get lastLogin => "lastLogin";

  static String get userThana => "userThana";

  static String get userAddress => "userAddress";

  static String get isActive => "isActive";

  static String get isBloodDooner => "isBloodDooner";

  static String get isSearchingBlood => "isSearchingBlood";

  static String get isLFToday => "isLFToday";

}
