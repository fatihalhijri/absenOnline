import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:absenonline/app/modules/jadwal/model/jadwal.dart';

class JadwalController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RxBool status = false.obs;
  final RxList<Jadwal> data = <Jadwal>[].obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getJadwal();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Fungsi untuk mengambil data jadwal dari Firestore
  Future<void> getJadwal() async {
    try {
      QuerySnapshot jadwalSnapshot = await firestore.collection("jadwal").get();
      List<Jadwal> jadwalList = jadwalSnapshot.docs.map((e) {
        return Jadwal.fromJson(e.data() as Map<String, dynamic>, e.id);
      }).toList();
      data.assignAll(jadwalList);
      status.value = true;
    } catch (e) {
      print("Error getting data: $e");
      status.value = false;
    }
  }

  // Fungsi untuk menambahkan jadwal baru
  Future<void> addJadwal(Jadwal jadwal) async {
    try {
      await firestore.collection("jadwal").add(jadwal.toJson());
      await getJadwal(); // Refresh data setelah penambahan
    } catch (e) {
      print("Error adding data: $e");
    }
  }

  // Fungsi untuk mengedit jadwal yang sudah ada
  Future<void> editJadwal(Jadwal jadwal) async {
    try {
      await firestore.collection("jadwal").doc(jadwal.id).update(jadwal.toJson());
      await getJadwal(); // Refresh data setelah update
    } catch (e) {
      print("Error updating data: $e");
    }
  }

  // Fungsi untuk menghapus jadwal
  Future<void> deleteJadwal(Jadwal jadwal) async {
    try {
      await firestore.collection("jadwal").doc(jadwal.id).delete();
      await getJadwal(); // Refresh data setelah penghapusan
    } catch (e) {
      print("Error deleting data: $e");
    }
  }

  // Fungsi untuk mencari jadwal berdasarkan query
  List<Jadwal> searchJadwal(String query) {
    return data.where((jadwal) {
      return jadwal.mapel.toLowerCase().contains(query.toLowerCase()) ||
             jadwal.hari.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  // Fungsi untuk me-refresh data jadwal
  Future<void> refreshData() async {
    status.value = false;
    await getJadwal();
  }
}