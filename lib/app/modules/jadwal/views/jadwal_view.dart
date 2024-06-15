import 'dart:js';

import 'package:absenonline/app/modules/jadwal/controllers/jadwal_controller.dart';
import 'package:absenonline/app/modules/jadwal/model/jadwal.dart';
import 'package:absenonline/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JadwalView extends GetView<JadwalController> {
  const JadwalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JadwalController controller = Get.put(JadwalController());

    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: IconButton(
          onPressed: () => Get.offAllNamed(Routes.HOME),
          icon: Icon(Icons.arrow_back)
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _searchBar(controller),
              SizedBox(height: 16),
              _filterBar(),
              SizedBox(height: 16),
              Expanded(
                child: Obx(() {
                  return controller.status.value
                      ? ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            _buildDataTable(controller),
                          ],
                        )
                      : Center(child: CircularProgressIndicator());
                }),
              ),
              SizedBox(height: 16),
              _actionButtons(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddEditDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
    );
  }

  Widget _searchBar(JadwalController controller) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Cari jadwal...',
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      ),
      onChanged: (value) {
        controller.searchQuery.value = value;
      },
    );
  }

  Widget _filterBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _roundedButton(title: 'Semua', isActive: true),
        _roundedButton(title: 'Hadir'),
        _roundedButton(title: 'Tidak Hadir'),
      ],
    );
  }

  Widget _buildDataTable(JadwalController controller) {
    List<Jadwal> filteredData = controller.data.where((jadwal) {
      return jadwal.mapel.toLowerCase().contains(controller.searchQuery.value.toLowerCase());
    }).toList();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('No', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Hari', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Mapel', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Jam Masuk', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Jam Keluar', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Kehadiran', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Aksi', style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: List.generate(
            filteredData.length,
            (index) {
              Jadwal jadwal = filteredData[index];
              return DataRow(
                cells: [
                  DataCell(Text((index + 1).toString())),
                  DataCell(Text(jadwal.hari)),
                  DataCell(Text(jadwal.mapel)),
                  DataCell(Text(jadwal.jamMasuk)),
                  DataCell(Text(jadwal.jamKeluar)),
                  DataCell(Text(jadwal.kehadiran)),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            _showAddEditDialog(context as BuildContext, jadwal: jadwal);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            controller.deleteJadwal(jadwal);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _roundedButton({
    required String title,
    bool isActive = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: isActive ? Colors.indigo : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.indigo),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.indigo,
        ),
      ),
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Implement detail view
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
          ),
          child: Text('DETAIL'),
        ),
        ElevatedButton(
          onPressed: () {
            // Refresh data
            Get.find<JadwalController>().refreshData();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
          ),
          child: Text('REFRESH'),
        ),
      ],
    );
  }

  void _showAddEditDialog(BuildContext context, {Jadwal? jadwal}) {
    final _formKey = GlobalKey<FormState>();
    String hari = jadwal?.hari ?? '';
    String mapel = jadwal?.mapel ?? '';
    String jamMasuk = jadwal?.jamMasuk ?? '';
    String jamKeluar = jadwal?.jamKeluar ?? '';
    String kehadiran = jadwal?.kehadiran ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(jadwal == null ? 'Tambah Jadwal' : 'Edit Jadwal'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: hari,
                  decoration: InputDecoration(labelText: 'Hari'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi hari';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    hari = value!;
                  },
                ),
                TextFormField(
                  initialValue: mapel,
                  decoration: InputDecoration(labelText: 'Mata Pelajaran'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi mata pelajaran';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    mapel = value!;
                  },
                ),
                TextFormField(
                  initialValue: jamMasuk,
                  decoration: InputDecoration(labelText: 'Jam Masuk'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi jam masuk';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    jamMasuk = value!;
                  },
                ),
                TextFormField(
                  initialValue: jamKeluar,
                  decoration: InputDecoration(labelText: 'Jam Keluar'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi jam keluar';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    jamKeluar = value!;
                  },
                ),
                TextFormField(
                  initialValue: kehadiran,
                  decoration: InputDecoration(labelText: 'Kehadiran'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi kehadiran';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    kehadiran = value!;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('BATAL'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  if (jadwal == null) {
                    Get.find<JadwalController>().addJadwal(Jadwal(
                      hari: hari,
                      mapel: mapel,
                      jamMasuk: jamMasuk,
                      jamKeluar: jamKeluar,
                      kehadiran: kehadiran, id: '',
                    ));
                  } else {
                    Get.find<JadwalController>().editJadwal(Jadwal(
                      id: jadwal.id,
                      hari: hari,
                      mapel: mapel,
                      jamMasuk: jamMasuk,
                      jamKeluar: jamKeluar,
                      kehadiran: kehadiran,
                    ));
                  }
                  Navigator.pop(context);
                }
              },
              child: Text(jadwal == null ? 'TAMBAH' : 'SIMPAN'),
            ),
          ],
        );
      },
    );
  }
}