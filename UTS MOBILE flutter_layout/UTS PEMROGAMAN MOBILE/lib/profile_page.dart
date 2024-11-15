import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Profile Page', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(
            255, 0, 157, 134), // Mengubah warna AppBar menjadi teal
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
              Text(
                'Hello, Let\'s Connect!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Mengubah warna teks menjadi putih
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Fifi Novitasari',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Mengubah warna teks menjadi putih
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Artist | Graphic Designer | Bussines Information System',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Mengubah warna teks menjadi putih
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'State Polytechnic of Malang',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Mengubah warna teks menjadi putih
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Email: fifinovitasari13@gmail.com',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white, // Mengubah warna teks menjadi putih
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}