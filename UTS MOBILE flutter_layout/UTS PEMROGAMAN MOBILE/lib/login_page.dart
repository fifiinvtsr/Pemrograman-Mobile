import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText =
      true; // Menambahkan variabel untuk mengatur visibilitas password

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page', style: TextStyle(color: Colors.white)),
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors
                        .white, // Mengubah warna latar belakang kotak input menjadi putih
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 157,
                            134)), // Ubah warna label menjadi hijau toska
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16), // Menambahkan spasi antar input
                TextFormField(
                  controller: _passwordController,
                  obscureText:
                      _obscureText, // Menggunakan variabel _obscureText untuk mengatur visibilitas password
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors
                        .white, // Mengubah warna latar belakang kotak input menjadi putih
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 157,
                            134)), // Ubah warna label menjadi hijau toska
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText =
                              !_obscureText; // Mengubah nilai _obscureText saat tombol ditekan
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Color.fromARGB(255, 0, 157,
                            134), // Ubah warna ikon menjadi hijau toska
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16), // Menambahkan spasi antar input
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            username: _usernameController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 255, 255, 255), // Mengubah warna tombol
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
