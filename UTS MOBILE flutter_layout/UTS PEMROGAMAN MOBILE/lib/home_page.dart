import 'package:flutter/material.dart';

import 'about_page.dart';
import 'login_page.dart'; // Impor LoginPage
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(
            255, 0, 157, 134), // Mengubah warna AppBar menjadi teal
        actions: [
          IconButton(
            onPressed: () {
              // Implementasi logika logout di sini
              // Navigasi ke halaman login
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          // Menggunakan gambar background
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('Welcome, $username', style: TextStyle(color: Colors.white)),
              SizedBox(height: 20), // Memberikan jarak ke tombol
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(username: username),
                    ),
                  );
                },
                child: const Text('Go to Profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 255, 255, 255), // Mengubah warna tombol
                ),
              ),
              SizedBox(height: 10), // Memberikan jarak ke tombol
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
                child: const Text(' About'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 255, 255, 255), // Mengubah warna tombol
                ),
              ),
              SizedBox(height: 10), // Memberikan jarak ke tombol
              ElevatedButton(
                onPressed: () {
                  // Implementasi logika logout di sini
                  // Navigasi ke halaman login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 255, 255, 255), // Mengubah warna tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
