import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';

Future<void> getWeather(double lat, double lon) async {
  final uri = Uri.parse("${domain}lat=$lat&lon=$lon&appid=$apiKey&units=metric"); // Menggunakan satuan metric (Celsius)
  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data); // Cetak data cuaca di terminal.
      // Di sini kamu bisa memproses data cuaca, seperti mengambil suhu, cuaca, dll.
    } else {
      print("Gagal mengambil data cuaca: ${response.statusCode}");
    }
  } catch (e) {
    print("Terjadi kesalahan saat mengambil data cuaca: $e");
  }
}
