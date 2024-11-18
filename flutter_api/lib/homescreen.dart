// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class  HomeScreen extends StatefulWidget {
//  @override
//  _Homescreen createState() => _Homescreen();
// }
// class _Homescreen extends State< HomeScreen> {
//  @override
//  Widget build(BuildContext context) {
//  return Container();
//  }
//  getCurrentLocation() async {
//  var p = await Geolocator.getCurrentPosition(
//  desiredAccuracy: LocationAccuracy.low,
//  forceAndroidLocationManager: true,
//  );
//  if (p != null) {
//  print('Lat:${p.latitude}, Long:${p.longitude}');
 
//  } else {
//  print('Data unavailable');
//  }
//  }

// }

// Langkah 1 : mendapatkan koordinat lokasi perangkat (latitude dan longitude)
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getCurrentLocation();
//   }

//   Future<void> getCurrentLocation() async {
//     try {
//       var position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low,
//         forceAndroidLocationManager: true,
//       );
//       if (position != null) {
//         print('Lat: ${position.latitude}, Long: ${position.longitude}');
//       } else {
//         print('Data unavailable');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//       )
//     );
//   }
// }


// langkah 3: Mendapatkan data cuaca dari lokasi saat ini
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart' as k;
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     getCurrentLocation();
//   }

//   Future<void> getCurrentLocation() async {
//     try {
//       var position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low,
//         forceAndroidLocationManager: true,
//       );
//       if (position != null) {
//         print('Lat: ${position.latitude}, Long: ${position.longitude}');
//         fetchWeather(position.latitude, position.longitude);
//       } else {
//         print('Data unavailable');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> fetchWeather(double lat, double lon) async {
//     final url = '${k.domain}lat=$lat&lon=$lon&appid=${k.apiKey}&units=metric';
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print('Weather: ${data['weather'][0]['description']}');
//       } else {
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Weather App'),
//         ),
//         body: Center(
//           child: Text('Mengambil Cuaca...'),
//         ),
//       ),
//     );
//   }
// }

// Panggilan API berdasarkan format garis lintang dan bujur
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart' as k;
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String weatherDescription = 'Mengambil Cuaca...';

//   @override
//   void initState() {
//     super.initState();
//     getCurrentLocation();
//   }

//   Future<void> getCurrentLocation() async {
//     try {
//       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         setState(() {
//           weatherDescription = 'Layanan lokasi tidak aktif.';
//         });
//         return;
//       }

//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           setState(() {
//             weatherDescription = 'Izin lokasi ditolak.';
//           });
//           return;
//         }
//       }

//       if (permission == LocationPermission.deniedForever) {
//         setState(() {
//           weatherDescription = 'Izin lokasi ditolak secara permanen.';
//         });
//         return;
//       }

//       var position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low,
//       );

//       if (position != null) {
//         print('Lat: ${position.latitude}, Long: ${position.longitude}');
//         fetchWeather(position.latitude, position.longitude);
//       } else {
//         setState(() {
//           weatherDescription = 'Lokasi tidak tersedia.';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         weatherDescription = 'Terjadi kesalahan: $e';
//       });
//     }
//   }

//   Future<void> fetchWeather(double lat, double lon) async {
//     final url = '${k.domain}lat=$lat&lon=$lon&appid=${k.apiKey}&units=metric';
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print('Response JSON: $data'); // Cetak JSON lengkap ke terminal
//         setState(() {
//           weatherDescription = '''
//             Cuaca: ${data['weather'][0]['description']}
//             Suhu: ${data['main']['temp']} °C
//             Kelembapan: ${data['main']['humidity']}%
//             Kecepatan Angin: ${data['wind']['speed']} m/s
//           ''';
//         });
//       } else {
//         setState(() {
//           weatherDescription = 'Error: ${response.statusCode}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         weatherDescription = 'Terjadi kesalahan: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Weather App'),
//         ),
//         body: Center(
//           child: Text(
//             weatherDescription,
//             style: TextStyle(fontSize: 16),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }

// Panggilan API berdasarkan kota
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart' as k;
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String weatherDescription = 'Mengambil Cuaca...';

//   @override
//   void initState() {
//     super.initState();
//     fetchWeather();
//   }

//   Future<void> fetchWeather() async {
//     try {
//       // Menggunakan URL dari constants.dart
//       final response = await http.get(Uri.parse(k.weatherUrl));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print('Response JSON: $data'); // Cetak JSON lengkap ke terminal
//         setState(() {
//           weatherDescription = '''x
//             Kota: ${data['name']}
//             Cuaca: ${data['weather'][0]['description']}
//             Suhu: ${data['main']['temp']} °C
//             Kelembapan: ${data['main']['humidity']}%
//             Kecepatan Angin: ${data['wind']['speed']} m/s
//           ''';
//         });
//       } else {
//         setState(() {
//           weatherDescription = 'Error: ${response.statusCode}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         weatherDescription = 'Terjadi kesalahan: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Weather App'),
//         ),
//         body: Center(
//           child: Text(
//             weatherDescription,
//             style: TextStyle(fontSize: 16),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }


// Langkah 5 :MenyelesaikanPembuatan
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart'; // Import file constants.dart
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // Variabel untuk menyimpan nilai cuaca dan status data
//   bool isLoaded = false; // Status apakah data sudah siap digunakan
//   num temp = 0; // Suhu
//   num press = 0; // Tekanan
//   num hum = 0; // Kelembapan
//   num cover = 0; // Tutupan awan
//   String cityname = 'Banyuwangi'; // Nama kota

//   @override
//   void initState() {
//     super.initState();
//     getCityWeather(); // Memanggil fungsi untuk mendapatkan data cuaca
//   }

//   // Fungsi untuk mengambil data cuaca dari API
//   Future<void> getCityWeather() async {
//     final url = Uri.parse(weatherUrl); // Mengambil URL dari constants.dart
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body); // Decode JSON menjadi Map

//         // Memperbarui variabel dengan data yang diambil dari API
//         setState(() {
//           temp = data['main']['temp']; // Menyimpan suhu
//           press = data['main']['pressure']; // Menyimpan tekanan
//           hum = data['main']['humidity']; // Menyimpan kelembapan
//           cover = data['clouds']['all']; // Menyimpan tutupan awan
//           cityname = data['name']; // Menyimpan nama kota
//           isLoaded = true; // Menandai bahwa data telah dimuat
//         });

//         print('Data berhasil diambil: $data'); // Menampilkan data di konsol
//       } else {
//         print('Error: ${response.statusCode}'); // Menangani error status code
//       }
//     } catch (e) {
//       print('Error: $e'); // Menangani error lainnya
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           // Dekorasi gradien untuk latar belakang
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft, // Gradien dimulai dari kiri atas
//               end: Alignment.bottomRight, // Gradien berakhir di kanan bawah
//               colors: [
//                 Color(0xFF1E3C72), // Biru tua
//                 Color(0xFF2A5298), // Biru muda
//                 Color(0xFF00B4DB), // Biru cerah
//               ],
//             ),
//           ),
//           child: Center(
//             child: isLoaded // Jika data sudah dimuat, tampilkan informasi cuaca
//                 ? Padding(
//                     padding: const EdgeInsets.all(16.0), // Memberikan padding
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Kota: $cityname', // Menampilkan nama kota
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 16), // Jarak antar elemen
//                         Text(
//                           'Suhu: ${temp.toString()} °C', // Menampilkan suhu
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           'Tekanan: ${press.toString()} hPa', // Menampilkan tekanan
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           'Kelembapan: ${hum.toString()}%', // Menampilkan kelembapan
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           'Tutupan Awan: ${cover.toString()}%', // Menampilkan tutupan awan
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : Text(
//                     "Mengambil data cuaca...", // Pesan saat data belum dimuat
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//Menambahkan visibility
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart'; // Import file constants.dart
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoaded = false;
//   num temp = 0;
//   num press = 0;
//   num hum = 0;
//   num cover = 0;
//   String cityname = '';
//   TextEditingController controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     getCurrentCityWeather();
//   }

//   // Metode dispose untuk membersihkan controller saat widget dihancurkan (menghindari kebocoran memori)
//   @override
//   void dispose() {
//     controller.dispose(); // Membersihkan controller ketika widget dihancurkan
//     super.dispose();
//   }

//   void updateUI(var decodedData) {
//     setState(() {
//       if (decodedData == null) {
//         temp = 0;
//         press = 0;
//         hum = 0;
//         cover = 0;
//         cityname = 'Not available';
//         isLoaded = false;
//       } else {
//         temp = decodedData['main']['temp'] - 273; // Konversi suhu dari Kelvin ke Celcius
//         press = decodedData['main']['pressure'];
//         hum = decodedData['main']['humidity'];
//         cover = decodedData['clouds']['all'];
//         cityname = decodedData['name'];
//         isLoaded = true;
//       }
//     });
//   }

//   // Fungsi untuk mengambil data cuaca berdasarkan kota saat ini
//   Future<void> getCurrentCityWeather() async {
//     final url = Uri.parse(weatherUrl); // URL API cuaca yang sudah didefinisikan di constants.dart
//     try {
//       final response = await http.get(url); // Mengambil data dari API
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         updateUI(data); // Memperbarui UI jika data berhasil diambil
//       } else {
//         print("Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   // Fungsi untuk mengambil data cuaca berdasarkan nama kota
//   Future<void> getCityWeather(String cityname) async {
//     final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey"); 
//     try {
//       final response = await http.get(url); // Mengambil data cuaca berdasarkan nama kota
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         updateUI(data); // Memperbarui UI dengan data yang diterima
//       } else {
//         print("Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xFF1E3C72),
//                 Color(0xFF2A5298),
//                 Color(0xFF00B4DB),
//               ],
//             ),
//           ),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Widget untuk pencarian kota
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.85,
//                   height: MediaQuery.of(context).size.height * 0.09,
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.3),
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   child: Center(
//                     child: TextFormField(
//                       onFieldSubmitted: (String s) {
//                         setState(() {
//                           cityname = s; // Menetapkan nama kota
//                           getCityWeather(s); // Mengambil data cuaca berdasarkan nama kota
//                           isLoaded = false; // Menampilkan indikator pemuatan
//                           controller.clear(); // Membersihkan teks input
//                         });
//                       },
//                       controller: controller,
//                       cursorColor: Colors.white,
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                       decoration: InputDecoration(
//                         hintText: 'Search city',
//                         hintStyle: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white.withOpacity(0.7),
//                           fontWeight: FontWeight.w600,
//                         ),
//                         prefixIcon: Icon(
//                           Icons.search_rounded,
//                           size: 25,
//                           color: Colors.white.withOpacity(0.7),
//                         ),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Menambahkan jarak (space) antara input pencarian dan data cuaca
//                 SizedBox(height: 30),

//                 // Menambahkan Row dengan Padding untuk menampilkan nama kota dan ikon lokasi
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.pin_drop, // Ikon lokasi
//                         color: Colors.red,
//                         size: 40,
//                       ),
//                       SizedBox(width: 8), // Memberikan jarak antar elemen
//                       Text(
//                         cityname, // Menampilkan nama kota
//                         overflow: TextOverflow.ellipsis, // Menampilkan teks dengan overflow jika terlalu panjang
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white, // Warna teks kota
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20), // Memberikan jarak antar elemen data cuaca dan pencarian

//                 // Menampilkan data cuaca atau CircularProgressIndicator jika data belum tersedia
//                 Visibility(
//                   visible: isLoaded, // Hanya menampilkan data jika isLoaded true
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Suhu: ${temp.toStringAsFixed(1)}°C", // Menampilkan suhu
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                       SizedBox(height: 8), // Jarak antar teks
//                       Text(
//                         "Tekanan: ${press} hPa", // Menampilkan tekanan udara
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                       SizedBox(height: 8), // Jarak antar teks
//                       Text(
//                         "Kelembapan: ${hum}%", // Menampilkan kelembapan
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                       SizedBox(height: 8), // Jarak antar teks
//                       Text(
//                         "Tutupan Awan: ${cover}%", // Menampilkan tutupan awan
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                   replacement: Center(
//                     // Jika data belum tersedia, tampilkan indikator pemuatan
//                     child: CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//Menambahkan gambar ikon termometer 
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'constants.dart'; // Import file constants.dart
// import 'dart:convert';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoaded = false;
//   num temp = 0;
//   num press = 0;
//   num hum = 0;
//   num cover = 0;
//   String cityname = '';
//   TextEditingController controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     getCurrentCityWeather();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   void updateUI(var decodedData) {
//     setState(() {
//       if (decodedData == null) {
//         temp = 0;
//         press = 0;
//         hum = 0;
//         cover = 0;
//         cityname = 'Not available';
//         isLoaded = false;
//       } else {
//         temp = decodedData['main']['temp'] - 273; // Konversi Kelvin ke Celcius
//         press = decodedData['main']['pressure'];
//         hum = decodedData['main']['humidity'];
//         cover = decodedData['clouds']['all'];
//         cityname = decodedData['name'];
//         isLoaded = true;
//       }
//     });
//   }

//   Future<void> getCurrentCityWeather() async {
//     final url = Uri.parse(weatherUrl);
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         updateUI(data);
//       } else {
//         print("Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> getCityWeather(String cityname) async {
//     final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey");
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         updateUI(data);
//       } else {
//         print("Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xFF1E3C72),
//                 Color(0xFF2A5298),
//                 Color(0xFF00B4DB),
//               ],
//             ),
//           ),
//           child: Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     // Pencarian kota
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.08,
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.3),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           onFieldSubmitted: (String s) {
//                             setState(() {
//                               cityname = s;
//                               getCityWeather(s);
//                               isLoaded = false;
//                               controller.clear();
//                             });
//                           },
//                           controller: controller,
//                           cursorColor: Colors.white,
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                           decoration: InputDecoration(
//                             hintText: 'Search city',
//                             hintStyle: TextStyle(
//                               fontSize: 18,
//                               color: Colors.white.withOpacity(0.7),
//                               fontWeight: FontWeight.w600,
//                             ),
//                             prefixIcon: Icon(
//                               Icons.search_rounded,
//                               size: 25,
//                               color: Colors.white.withOpacity(0.7),
//                             ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     // Nama kota dengan ikon lokasi
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.pin_drop,
//                             color: Colors.red,
//                             size: MediaQuery.of(context).size.width * 0.08,
//                           ),
//                           SizedBox(width: 10),
//                           Flexible(
//                             child: Text(
//                               cityname,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 fontSize: MediaQuery.of(context).size.width * 0.06,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Visibility(
//                       visible: isLoaded,
//                       child: Column(
//                         children: [
//                           // Kartu suhu
//                           Container(
//                             width: double.infinity,
//                             height: MediaQuery.of(context).size.height * 0.12,
//                             margin: EdgeInsets.symmetric(vertical: 10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.shade900,
//                                   offset: Offset(1, 2),
//                                   blurRadius: 3,
//                                   spreadRadius: 1,
//                                 )
//                               ],
//                             ),
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Image(
//                                     image: AssetImage('images/thermometer.png'),
//                                     width: MediaQuery.of(context).size.width * 0.12,
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Flexible(
//                                   child: Text(
//                                     'Temperature: ${temp.toInt()} ºC',
//                                     style: TextStyle(
//                                       fontSize: MediaQuery.of(context).size.width * 0.05,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             "Pressure: ${press} hPa",
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             "Humidity: ${hum}%",
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             "Cloud Cover: ${cover}%",
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       replacement: Center(
//                         child: CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// Menambahkan gambar ikon termometer 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'constants.dart'; // Import file constants.dart
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoaded = false;
  num temp = 0;
  num press = 0;
  num hum = 0;
  num cover = 0;
  String cityname = '';
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentCityWeather();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateUI(var decodedData) {
    setState(() {
      if (decodedData == null) {
        temp = 0;
        press = 0;
        hum = 0;
        cover = 0;
        cityname = 'Not available';
        isLoaded = false;
      } else {
        temp = decodedData['main']['temp'] - 273; // Konversi Kelvin ke Celcius
        press = decodedData['main']['pressure'];
        hum = decodedData['main']['humidity'];
        cover = decodedData['clouds']['all'];
        cityname = decodedData['name'];
        isLoaded = true;
      }
    });
  }

  Future<void> getCurrentCityWeather() async {
    final url = Uri.parse(weatherUrl);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        updateUI(data);
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getCityWeather(String cityname) async {
    final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        updateUI(data);
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1E3C72),
                Color(0xFF2A5298),
                Color(0xFF00B4DB),
              ],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Pencarian kota
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: TextFormField(
                          onFieldSubmitted: (String s) {
                            setState(() {
                              cityname = s;
                              getCityWeather(s);
                              isLoaded = false;
                              controller.clear();
                            });
                          },
                          controller: controller,
                          cursorColor: Colors.white,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search city',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.w600,
                            ),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              size: 25,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    // Nama kota dengan ikon lokasi
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pin_drop,
                            color: Colors.red,
                            size: MediaQuery.of(context).size.width * 0.08,
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              cityname,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.06,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Visibility(
                      visible: isLoaded,
                      child: Column(
                        children: [
                          // Kartu suhu
                          buildWeatherCard(
                            context,
                            'Temperature',
                            '${temp.toInt()} ºC',
                            'images/thermometer.png',
                          ),
                          // Kartu tekanan udara
                          buildWeatherCard(
                            context,
                            'Pressure',
                            '${press} hPa',
                            'images/barometer.png',
                          ),
                          // Kartu kelembapan
                          buildWeatherCard(
                            context,
                            'Humidity',
                            '${hum}%',
                            'images/humidity.png',
                          ),
                          // Kartu tutupan awan
                          buildWeatherCard(
                            context,
                            'Cloud Cover',
                            '${cover}%',
                            'images/cloud cover.png',
                          ),
                        ],
                      ),
                      replacement: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat kartu parameter cuaca
  Widget buildWeatherCard(BuildContext context, String title, String value, String imagePath) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.12,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            offset: Offset(1, 2),
            blurRadius: 3,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        children: [
          // Gambar parameter
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(imagePath),
              width: MediaQuery.of(context).size.width * 0.12,
            ),
          ),
          SizedBox(width: 10),
          // Teks parameter
          Flexible(
            child: Text(
              '$title: $value',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
