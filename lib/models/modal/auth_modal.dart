// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
    final String? refreshToken;
    final String? accessToken;
    final DateTime? expiration;
    final User? user;

    AuthModel({
        this.refreshToken,
        this.accessToken,
        this.expiration,
        this.user,
    });

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        refreshToken: json["refreshToken"],
        accessToken: json["accessToken"],
        expiration: json["expiration"] == null ? null : DateTime.parse(json["expiration"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "refreshToken": refreshToken,
        "accessToken": accessToken,
        "expiration": expiration?.toIso8601String(),
        "user": user?.toJson(),
    };
}

class User {
    final int? id;
    final String? roleName;
    final String? email;
    final String? nameSurname;
    final bool? isAdmin;
    final dynamic claims;

    User({
        this.id,
        this.roleName,
        this.email,
        this.nameSurname,
        this.isAdmin,
        this.claims,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        roleName: json["roleName"],
        email: json["email"],
        nameSurname: json["nameSurname"],
        isAdmin: json["isAdmin"],
        claims: json["claims"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "roleName": roleName,
        "email": email,
        "nameSurname": nameSurname,
        "isAdmin": isAdmin,
        "claims": claims,
    };
}
