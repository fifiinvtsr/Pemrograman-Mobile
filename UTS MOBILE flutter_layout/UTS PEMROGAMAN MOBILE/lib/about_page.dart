import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page',
            style: TextStyle(
              color: Colors.white, // Mengubah warna teks menjadi putih
            )),
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
        child: const Center(
          child: Text(
            'This is a simple Flutter app for UTS Mobile Programming.',
            style: TextStyle(
              // Choose a better color that contrasts
              color: Color.fromARGB(
                  255, 255, 255, 255), //  Try black for strong contrast
            ),
          ),
        ),
      ),
    );
  }
}
