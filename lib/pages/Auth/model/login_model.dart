class LoginModel {
  bool? success;
  String? message;
  User? user;
  String? error; // New field for error message

  LoginModel({this.success, this.message, this.user, this.error});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      // If error key is present, return model with error
      return LoginModel(error: json['error']);
    } else {
      // Normal success response
      return LoginModel(
        success: json['success'],
        message: json['message'],
        user: json['user'] != null ? User.fromJson(json['user']) : null,
      );
    }
  }

  Map<String, dynamic> toJson() {
    if (error != null) {
      return {
        'error': error,
      };
    } else {
      final Map<String, dynamic> data = {};
      data['success'] = success;
      data['message'] = message;
      if (user != null) {
        data['user'] = user!.toJson();
      }
      return data;
    }
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? token;

  User({this.id, this.name, this.email, this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }
}
