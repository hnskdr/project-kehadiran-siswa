import 'package:flutter/material.dart';

class KehadiranProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _dataMahasiswa = [
    {'name': 'Hendra Iskandar Shah', 'presensi': false},
    {'name': 'Reyna', 'presensi': false},
    {'name': 'Phoenix', 'presensi': false},
    {'name': 'Sova', 'presensi': false},
    {'name': 'Clove', 'presensi': false},
    {'name': 'Cypher', 'presensi': false},
  ];

  final List<Map<String, dynamic>> _history = [];

  List<Map<String, dynamic>> get dataMahasiswa => _dataMahasiswa;
  List<Map<String, dynamic>> get history => _history;

  void toggleProvider(int index) {
    _dataMahasiswa[index]['presensi'] = !_dataMahasiswa[index]['presensi'];
    notifyListeners();
  }

  void saveKehadiran() {
    final now = DateTime.now();
    final jumlahMahasiswa =
        _dataMahasiswa.where((data) => data['presensi']).length;
    final absen = _dataMahasiswa.length - jumlahMahasiswa;

    _history.insert(0, {
      'date': '${now.day}-${now.month}-${now.year}',
      'data mahasiswa': jumlahMahasiswa,
      'absen': absen,
    });

    for (var dataMahasiswa in _dataMahasiswa) {
      dataMahasiswa['presensi'] = false;
    }

    notifyListeners();
  }
}