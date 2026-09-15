import 'package:flutter/material.dart';

class UserData {
  final String name;
  final String bio;
  final IconData icon;

  const UserData({required this.name, required this.bio, required this.icon});
}

const List<UserData> users = [
  UserData(
    name: 'Zulfa Fitri',
    bio: 'Membangun solusi digital yang sederhana dan bermanfaat.',
    icon: Icons.person,
  ),
  UserData(
    name: 'Park Keonho',
    bio: 'Suka berbagi pengetahuan tentang desain dan teknologi.',
    icon: Icons.person,
  ),
  UserData(
    name: 'So Junghwan',
    bio: 'Mengembangkan aplikasi yang mudah digunakan dan terpercaya.',
    icon: Icons.person,
  ),
];

class UserModel {
  final String id;
  final String name;
  final String? email;
  final int age;
  final bool isActive;

  UserModel({
    required this.id,
    required this.name,
    this.email,
    required this.age,
    required this.isActive,
  });

  factory UserModel.fromJson(Map json) {
    return UserModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? 'Unknown User',
      email: json['email'] as String?,
      age: json['age'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? false,
    );
  }

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'isActive': isActive,
    };
  }
}
