import 'package:portofolio_bloc_app/features/auth/domain/entities/admin_user.dart';

class AdminUserModel extends AdminUser {
  AdminUserModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.password});

  factory AdminUserModel.fromJson(Map<String, dynamic> json) {
    return AdminUserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
