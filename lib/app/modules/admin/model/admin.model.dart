// To parse this JSON data, do
//
//     final absenModel = absenModelFromJson(jsonString);

import 'dart:convert';

AbsenModel absenModelFromJson(String str, String id) =>
    AbsenModel.fromJson(json.decode(str), id);

String absenModelToJson(AbsenModel data) => json.encode(data.toJson());

class AbsenModel {
  String nama;
  String kelas;
  String masuk;
  String pulang;
  bool status;
  String id;

  AbsenModel({
    required this.nama,
    required this.kelas,
    required this.status,
    required this.id,
    required this.masuk,
    required this.pulang,
  });

  factory AbsenModel.fromJson(Map<String, dynamic> json, String id) =>
      AbsenModel(
        nama: json["nama"],
        kelas: json["kelas"],
        status: json["status"],
        masuk: json["masuk"],
        pulang: json["pulang"],
        id: id,
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "kelas": kelas,
        "status": status,
        "masuk": masuk,
        "pulang": pulang,
        "id": id,
      };
}
