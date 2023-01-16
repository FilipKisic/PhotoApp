import 'package:flutter/material.dart';
import 'package:photo_app/domain/entity/post.dart';

class SelectedPostProvider extends ChangeNotifier {
  Post? selectedPost;

  void selectPost(Post selected) {
    selectedPost = selected;
    notifyListeners();
  }
}