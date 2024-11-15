import 'package:flutter/material.dart';

import 'login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page',
            style: TextStyle(
                color:
                    Colors.white)), // Mengubah warna teks AppBar menjadi putih
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
              const Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Silahkan masuk untuk Login',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Login',
                    style: TextStyle(
                        color: Colors
                            .black)), // Mengubah warna teks tombol menjadi hitam
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
