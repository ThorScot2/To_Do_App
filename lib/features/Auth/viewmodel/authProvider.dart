import 'package:flutter/material.dart';
import '../model/userModel.dart';
import '../service/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;
  UserModel? user;
  String? token;
  String? error;

  Future<void> login(String email, String password) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final response = await _authService.login(email, password);

      user = response.user;
      token = response.token;

    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register(String name, String email, String password) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final response = await _authService.register(name, email, password);

      user = response.user;
      token = response.token;

    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}