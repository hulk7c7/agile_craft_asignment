import 'dart:convert';

class Auth {
  final Result result;
  final dynamic targetUrl;
  final bool success;
  final dynamic error;
  final bool unAuthorizedRequest;
  final bool abp;

  Auth({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  Auth copyWith({
    Result? result,
    dynamic targetUrl,
    bool? success,
    dynamic error,
    bool? unAuthorizedRequest,
    bool? abp,
  }) =>
      Auth(
        result: result ?? this.result,
        targetUrl: targetUrl ?? this.targetUrl,
        success: success ?? this.success,
        error: error ?? this.error,
        unAuthorizedRequest: unAuthorizedRequest ?? this.unAuthorizedRequest,
        abp: abp ?? this.abp,
      );

  factory Auth.fromRawJson(String str) => Auth.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    result: Result.fromJson(json["result"]),
    targetUrl: json["targetUrl"],
    success: json["success"],
    error: json["error"],
    unAuthorizedRequest: json["unAuthorizedRequest"],
    abp: json["__abp"],
  );

  Map<String, dynamic> toJson() => {
    "result": result.toJson(),
    "targetUrl": targetUrl,
    "success": success,
    "error": error,
    "unAuthorizedRequest": unAuthorizedRequest,
    "__abp": abp,
  };
}

class Result {
  final String accessToken;
  final String encryptedAccessToken;
  final int expireInSeconds;
  final bool shouldResetPassword;
  final dynamic passwordResetCode;
  final int userId;
  final bool requiresTwoFactorVerification;
  final dynamic twoFactorAuthProviders;
  final dynamic twoFactorRememberClientToken;
  final dynamic returnUrl;
  final String refreshToken;
  final int refreshTokenExpireInSeconds;

  Result({
    required this.accessToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.shouldResetPassword,
    required this.passwordResetCode,
    required this.userId,
    required this.requiresTwoFactorVerification,
    required this.twoFactorAuthProviders,
    required this.twoFactorRememberClientToken,
    required this.returnUrl,
    required this.refreshToken,
    required this.refreshTokenExpireInSeconds,
  });

  Result copyWith({
    String? accessToken,
    String? encryptedAccessToken,
    int? expireInSeconds,
    bool? shouldResetPassword,
    dynamic passwordResetCode,
    int? userId,
    bool? requiresTwoFactorVerification,
    dynamic twoFactorAuthProviders,
    dynamic twoFactorRememberClientToken,
    dynamic returnUrl,
    String? refreshToken,
    int? refreshTokenExpireInSeconds,
  }) =>
      Result(
        accessToken: accessToken ?? this.accessToken,
        encryptedAccessToken: encryptedAccessToken ?? this.encryptedAccessToken,
        expireInSeconds: expireInSeconds ?? this.expireInSeconds,
        shouldResetPassword: shouldResetPassword ?? this.shouldResetPassword,
        passwordResetCode: passwordResetCode ?? this.passwordResetCode,
        userId: userId ?? this.userId,
        requiresTwoFactorVerification: requiresTwoFactorVerification ?? this.requiresTwoFactorVerification,
        twoFactorAuthProviders: twoFactorAuthProviders ?? this.twoFactorAuthProviders,
        twoFactorRememberClientToken: twoFactorRememberClientToken ?? this.twoFactorRememberClientToken,
        returnUrl: returnUrl ?? this.returnUrl,
        refreshToken: refreshToken ?? this.refreshToken,
        refreshTokenExpireInSeconds: refreshTokenExpireInSeconds ?? this.refreshTokenExpireInSeconds,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    accessToken: json["accessToken"],
    encryptedAccessToken: json["encryptedAccessToken"],
    expireInSeconds: json["expireInSeconds"],
    shouldResetPassword: json["shouldResetPassword"],
    passwordResetCode: json["passwordResetCode"],
    userId: json["userId"],
    requiresTwoFactorVerification: json["requiresTwoFactorVerification"],
    twoFactorAuthProviders: json["twoFactorAuthProviders"],
    twoFactorRememberClientToken: json["twoFactorRememberClientToken"],
    returnUrl: json["returnUrl"],
    refreshToken: json["refreshToken"],
    refreshTokenExpireInSeconds: json["refreshTokenExpireInSeconds"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "encryptedAccessToken": encryptedAccessToken,
    "expireInSeconds": expireInSeconds,
    "shouldResetPassword": shouldResetPassword,
    "passwordResetCode": passwordResetCode,
    "userId": userId,
    "requiresTwoFactorVerification": requiresTwoFactorVerification,
    "twoFactorAuthProviders": twoFactorAuthProviders,
    "twoFactorRememberClientToken": twoFactorRememberClientToken,
    "returnUrl": returnUrl,
    "refreshToken": refreshToken,
    "refreshTokenExpireInSeconds": refreshTokenExpireInSeconds,
  };
}
