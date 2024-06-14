// To parse this JSON data, do
//
//     final jadwal = jadwalFromJson(jsonString);

import 'dart:convert';

Jadwal jadwalFromJson(String str, String id) => Jadwal.fromJson(json.decode(str), id);

String jadwalToJson(Jadwal data) => json.encode(data.toJson());

class Jadwal {
    String id;
    String mapel;
    String hari;
    String jamMasuk;
    String jamKeluar;
    String kehadiran;

    Jadwal({
        required this.mapel,
        required this.id,
        required this.hari,
        required this.jamMasuk,
        required this.jamKeluar,
        required this.kehadiran,
    });

    factory Jadwal.fromJson(Map<String, dynamic> json, String id) => Jadwal(
        id: id,
        mapel: json["mapel"],
        hari: json["hari"],
        jamMasuk: json["jamMasuk"],
        jamKeluar: json["jamKeluar"],
        kehadiran: json["kehadiran"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mapel": mapel,
        "hari": hari,
        "jamMasuk": jamMasuk,
        "jamKeluar": jamKeluar,
        "kehadiran": kehadiran,
    };
}
