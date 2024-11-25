import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  // Getter untuk mendapatkan data user
  User? get user => _user;

  // Login method
  Future<bool> login(String email, String password) async {
    bool success = await _authService.login(email, password);
    if (success) {
      _user = await _authService.getProfile();
      notifyListeners();
    }
    return success;
  }

  // Logout method
  Future<void> logout() async {
    await _authService.logout();
    _user = null;
    notifyListeners();
  }

  // Load user profile
  Future<void> loadUser() async {
    _user = await _authService.getProfile();
    notifyListeners();
  }
}
