import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String? userId;
  final String? username;
  final String? fullName;
  final String? email;
  final int? plan;
  final double? expenses;
  String? imageUrl;

  AppUser({
    required this.userId,
    required this.username,
    required this.fullName,
    this.imageUrl,
    this.email,
    this.plan,
    this.expenses,
  });

  factory AppUser.fromSnapshot(DocumentSnapshot snapshot) => AppUser(
        userId: snapshot['userId'] as String,
        username: snapshot['username'] as String,
        fullName: snapshot['fullName'] as String,
        email: snapshot['email'] as String,
        plan: snapshot['plan'] as int?,
        expenses: snapshot['expenses'] as double?,
        imageUrl: snapshot['imageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'username': username,
        'fullName': fullName,
        'email': email,
        'plan': plan,
        'expenses': 0.0,
        'imageUrl': imageUrl,
      };
}
