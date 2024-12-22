import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String? password;
  final String? avatarlink;
  final String github;
  final String linkedin;
  const ProfileModel(
      {this.id,
      required this.name,
      required this.phone,
      required this.email,
      this.avatarlink,
      required this.github,
      required this.linkedin,
      this.password});

  toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'avatarlink': avatarlink,
      'github': github,
      'linkedin': linkedin,
      'password': password
    };
  }

  factory ProfileModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProfileModel(
        id: document.id,
        name: data['name'],
        phone: data['phone'],
        avatarlink: data['avatarlink'],
        email: data['email'],
        github: data['github'],
        linkedin: data['linkedin'],
        password: data['password']);
  }
}
