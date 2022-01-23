import 'package:flutter/material.dart';

class Repository {
  String title, dateCreated, watchers, stars, forks, avatarUrl;

  Repository({
    @required this.title,
    @required this.dateCreated,
    @required this.watchers,
    @required this.stars,
    @required this.forks,
    @required this.avatarUrl,
  });
}

class RepositoryApiResponse {
  List<Repository> repository = [];

  RepositoryApiResponse.fromJson(json) {
    (json['items']).forEach((value) {
      repository.add(Repository(
          title: value['full_name'],
          dateCreated: value['created_at'],
          watchers: value['watchers_count'].toString(),
          stars: value['stargazers_count'].toString(),
          avatarUrl: value['owner']['avatar_url'],
          forks: value['forks'].toString()));
    });
  }
}
