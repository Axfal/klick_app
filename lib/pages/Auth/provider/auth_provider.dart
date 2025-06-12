// ignore_for_file: avoid_print

import 'package:klik_app/constants/exports.dart';

import '../with otp/otp_screen.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool get isLoading => _isLoading;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  get user => null;

  /// Toggle Password Visibility
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  /// Toggle Confirm Password Visibility
  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  /// Set Loading State
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  LoginModel? _loginModel;
  LoginModel? get loginModel => _loginModel;

  Future<void> loginUser(context, String email, String password) async {
    _setLoading(true);
    notifyListeners();

    try {
      final response = await _authService.signIn(email, password);

      if (response != null &&
          response['success'] == true &&
          response['message'] != null) {
        _loginModel = LoginModel.fromJson(response);

        ToastHelper.showSuccess(response['message']);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );

        // Save user session if login is successful and user data is present
        if (_loginModel != null && _loginModel!.user != null) {
          await LocalStorageService().saveUserSession(_loginModel!);
        }
      } else if (response != null) {
        _loginModel = LoginModel.fromJson(response);
        ToastHelper.showError(_loginModel?.error ?? "");
      }
    } catch (error) {
      print("error: $error");
    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }

  /// User Sign-up
  Future<void> signUpUser(
    context, {
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
    notifyListeners();

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
      if (response != null && response['success'] != null) {
        ToastHelper.showSuccess(response['success']);
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SignInWithEmail()),
          );
        });
      } else {
        ToastHelper.showSuccess(response!['error']);
      }
    } catch (error) {
      print("error: $error");
    } finally {
      _setLoading(false);
      notifyListeners();
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

  Future<void> requestSignInOtp(context, String email) async {
    _setLoading(true);
    notifyListeners();
    try {
      final response = await _authService.requestSignInOtp(email);
      if (response != null && response['success'] != null) {
        ToastHelper.showError(response['success']);
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OtpScreen(email)),
          );
        });
      } else {
        ToastHelper.showError(response!['error']);
      }
    } catch (e) {
      print("error: $e");
    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }

  Future<void> verifyOtp(
    context, {
    required String email,
    required String otp,
  }) async {
    _setLoading(true);
    notifyListeners();

    try {
      final response = await _authService.verifyOtp(email, otp);
      if (response != null &&
          response['success'] == true &&
          response['message'] != null) {
        _loginModel = LoginModel.fromJson(response);

        ToastHelper.showSuccess(response['message']);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );

        if (_loginModel != null && _loginModel!.user != null) {
          await LocalStorageService().saveUserSession(_loginModel!);
        }
      } else if (response != null) {
        _loginModel = LoginModel.fromJson(response);
        ToastHelper.showError(_loginModel?.error ?? "");
      }
    } catch (e) {
      print("error: $e");
    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }

  /// User Logout
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
