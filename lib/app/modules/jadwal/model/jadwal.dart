import 'dart:convert';
import 'package:flutter/material.dart';

class Jadwal {
  String id;
  String mapel;
  String hari;
  String jamMasuk;
  String jamKeluar;
  String kehadiran;

  Jadwal({
    required this.id,
    required this.mapel,
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

  bool validate() {
    return mapel.isNotEmpty &&
           hari.isNotEmpty &&
           jamMasuk.isNotEmpty &&
           jamKeluar.isNotEmpty &&
           kehadiran.isNotEmpty;
  }

  bool overlapsWith(Jadwal other) {
    if (hari != other.hari) return false;
    TimeOfDay start1 = _parseTime(jamMasuk);
    TimeOfDay end1 = _parseTime(jamKeluar);
    TimeOfDay start2 = _parseTime(other.jamMasuk);
    TimeOfDay end2 = _parseTime(other.jamKeluar);

    return (start1.hour < end2.hour || (start1.hour == end2.hour && start1.minute < end2.minute)) &&
           (start2.hour < end1.hour || (start2.hour == end1.hour && start2.minute < end1.minute));
  }

  TimeOfDay _parseTime(String time) {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  @override
  String toString() {
    return 'Jadwal(mapel: $mapel, hari: $hari, jamMasuk: $jamMasuk, jamKeluar: $jamKeluar, kehadiran: $kehadiran)';
  }

  static int compareTimeOfDay(TimeOfDay time1, TimeOfDay time2) {
    if (time1.hour < time2.hour || (time1.hour == time2.hour && time1.minute < time2.minute)) {
      return -1;
    } else if (time1.hour == time2.hour && time1.minute == time2.minute) {
      return 0;
    } else {
      return 1;
    }
  }

  static List<Jadwal> sortByJamMasuk(List<Jadwal> jadwalList) {
    jadwalList.sort((a, b) {
      TimeOfDay timeA = a._parseTime(a.jamMasuk);
      TimeOfDay timeB = b._parseTime(b.jamMasuk);
      return compareTimeOfDay(timeA, timeB);
    });
    return jadwalList;
  }

  static Map<String, List<Jadwal>> groupByHari(List<Jadwal> jadwalList) {
    Map<String, List<Jadwal>> grouped = {};
    for (var jadwal in jadwalList) {
      if (!grouped.containsKey(jadwal.hari)) {
        grouped[jadwal.hari] = [];
      }
      grouped[jadwal.hari]!.add(jadwal);
    }
    return grouped;
  }
}

/// Function to parse `Jadwal` from JSON string
Jadwal jadwalFromJson(String str, String id) => Jadwal.fromJson(json.decode(str), id);

/// Function to convert `Jadwal` to JSON string
String jadwalToJson(Jadwal data) => json.encode(data.toJson());