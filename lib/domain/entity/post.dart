import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Post {
  final Timestamp createDate;
  final String? description;
  final List<String>? hashtags;
  final String userId;
  String imageUrl;
  PostUser? user;
  String? heroTag;

  Post({
    required this.createDate,
    required this.imageUrl,
    required this.userId,
    this.description,
    this.hashtags,
    this.user,
    this.heroTag,
  });

  factory Post.fromSnapshot(DocumentSnapshot snapshot) => Post(
        createDate: snapshot['createDate'] as Timestamp,
        description: snapshot['description'] as String?,
        hashtags: List.from(snapshot['hashtags']),
        imageUrl: snapshot['imageUrl'] as String,
        userId: snapshot['userId'] as String,
      );

  Map<String, dynamic> toJson() {
    return {
      'createDate': createDate,
      'description': description,
      'hashtags': hashtags,
      'imageUrl': imageUrl,
      'userId': userId,
    };
  }

  String get hashtagsAsSingleString {
    String builder = '';
    hashtags!.forEach((hashtag) => builder += '$hashtag ');
    return builder;
  }

  String get formattedCreateDate {
    final formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(createDate.toDate());
  }
}

class PostUser {
  final String username;
  String? profileImageUrl;

  PostUser({
    required this.username,
    this.profileImageUrl,
  });

  factory PostUser.fromSnapshot(DocumentSnapshot snapshot) => PostUser(
        username: snapshot['username'] as String,
        profileImageUrl: snapshot['imageUrl'] as String?,
      );
}
