import 'package:flutter/material.dart';

class User {
  String nickname, avatarUrl;

  User({
    @required this.nickname,
    @required this.avatarUrl,
  });
}

class UserApiResponse {
  List<User> user = [];

  UserApiResponse.fromJson(json) {
    (json['items']).forEach((value) {
      user.add(User(nickname: value['login'], avatarUrl: value['avatar_url']));
    });
  }
}
