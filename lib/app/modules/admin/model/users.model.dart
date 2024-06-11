// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String nama;
    String email;
    String dibuatPada;

    UserModel({
        required this.nama,
        required this.email,
        required this.dibuatPada,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nama: json["nama"],
        email: json["email"],
        dibuatPada: json["dibuat_pada"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "dibuat_pada": dibuatPada,
    };
}
