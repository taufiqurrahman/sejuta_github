import 'package:flutter/material.dart';

class Issue {
  String title, avatarUrl, state, date;

  Issue({
    @required this.title,
    @required this.avatarUrl,
    @required this.state,
    @required this.date,
  });
}

class IssueApiResponse {
  List<Issue> issue = [];

  IssueApiResponse.fromJson(json) {
    (json['items']).forEach((value) {
      issue.add(Issue(
          title: value['title'],
          avatarUrl: value['user']['avatar_url'],
          date: value['updated_at'],
          state: value['state']));
    });
  }
}
