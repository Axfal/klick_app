import 'package:klik_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class EmailAuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool get isLoading => _isLoading;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  get user => null;

  /// 🔹 Toggle Password Visibility
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  /// 🔹 Toggle Confirm Password Visibility
  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  /// 🔹 **Set Loading State**
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>?> loginUser({
    String email = "dummy@example.com",
    String password = "dummy123",
  }) async {
    _setLoading(true);
    try {
      final response = await _authService.signIn(email, password);
      return {'success': true, 'token': response?['token'] ?? 'dummy-token'};
    } catch (error) {
      return {'success': false, 'message': error.toString()};
    } finally {
      _setLoading(false);
    }
  }

  // /// 🔹 **User Login**
  // Future<Map<String, dynamic>?> loginUser({
  //   required String email,
  //   required String password,
  // }) async {
  //   _setLoading(true);
  //   try {
  //     final response = await _authService.signIn(email, password);
  //     return response;
  //   } catch (error) {
  //     return {'success': false, 'message': error.toString()};
  //   } finally {
  //     _setLoading(false);
  //   }
  // }

  /// 🔹 **User Sign-up**
  Future<Map<String, dynamic>?> signUpUser({
    required String name,
    required String email,
    required String phone,
    required String countryCode,
    required String password,
    required String confirmPassword,
    required String deviceId,
    String? referralCode,
  }) async {
    _setLoading(true);
    try {
      final response = await _authService.signUp(
        name: name,
        email: email,
        phone: phone,
        countryCode: countryCode,
        password: password,
        confirmPassword: confirmPassword,
        deviceId: deviceId,
        referralCode: referralCode,
      );
      return {'success': true, 'user_id': response?['user_id'] ?? '123'};
    } catch (error) {
      return {'success': false, 'message': error.toString()};
    } finally {
      _setLoading(false);
    }
  }
  //     if (response == null || response.isEmpty) {
  //       return {'success': false, 'message': "Invalid response from server"};
  //     }

  //     // ✅ Directly check if API success key is string or bool
  //     if (response['success'] == true) {
  //       return {
  //         'success': true,
  //         'user_id': response['user_id'],
  //         'message': response['message'] ?? "User registered successfully!",
  //       };
  //     }

  //     return {'success': false, 'message': response['message'] ?? "Registration failed."};
  //   } catch (error) {
  //     return {'success': false, 'message': error.toString()};
  //   } finally {
  //     _setLoading(false);
  //   }
  // }

  Future<Map<String, dynamic>?> requestSignInOtp(String email) async {
    return {'success': true, 'message': 'OTP sent (simulated)'};
  }

  Future<Map<String, dynamic>?> verifyOtp({
    required String email,
    required String otp,
  }) async {
    return {'success': true, 'message': 'OTP verified (simulated)'};
  }

  // /// 🔹 **Request Sign-in OTP**
  // Future<Map<String, dynamic>?> requestSignInOtp(String email) async {
  //   _setLoading(true);
  //   try {
  //     final response = await _authService.requestSignInOtp(email);

  //     // ✅ Fix: Check if success key is either `true` or contains "OTP sent"
  //     if (response != null &&
  //         response.containsKey('success') &&
  //         (response['success'] == true ||
  //             response['success'] == "OTP sent to email")) {
  //       return response;
  //     }

  //     return {
  //       'success': false,
  //       'message': response?['message'] ?? "Unexpected response format",
  //     };
  //   } catch (error) {
  //     return {'success': false, 'message': error.toString()};
  //   } finally {
  //     _setLoading(false);
  //   }
  // }

  // /// 🔹 **Verify OTP**
  // Future<Map<String, dynamic>?> verifyOtp({
  //   required String email,
  //   required String otp,
  // }) async {
  //   _setLoading(true);
  //   try {
  //     final response = await _authService.verifyOtp(email, otp);
  //     return response;
  //   } catch (error) {
  //     return {'success': false, 'message': error.toString()};
  //   } finally {
  //     _setLoading(false);
  //   }
  // }

  /// 🔹 **User Logout**
  Future<Map<String, dynamic>?> logout(String token) async {
    _setLoading(true);
    try {
      final response = await _authService.logout(token);
      return response;
    } catch (error) {
      return {'success': false, 'message': error.toString()};
    } finally {
      _setLoading(false);
    }
  }
}
