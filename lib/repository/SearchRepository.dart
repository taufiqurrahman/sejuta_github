import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:sejuta_cita/bloc/search_bloc.dart';
import 'package:sejuta_cita/config/api.dart';
import 'package:sejuta_cita/models/issue.dart';
import 'package:sejuta_cita/models/repository.dart';
import 'package:sejuta_cita/models/user.dart';

class SearchRepository {
  Dio dio = new Dio();

  Future<UserApiResponse> searchUser(String page, String query) async {
    final String url = github_api_url;
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    try {
      final response = await dio.get(url +
          '/search/users?q=' +
          Uri.encodeQueryComponent(query) +
          '&page=' +
          Uri.encodeQueryComponent(page));

      print(response);

      return UserApiResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.headers['x-ratelimit-used']);
        if (e.response.headers['x-ratelimit-used'].toString() == '[10]') {
          throw ('limit exceeded');
        }
      } else {
        print(e.message);
      }
      throw ("error");
    }
  }

  Future<IssueApiResponse> searchIssues(String page, String query) async {
    final String url = github_api_url;
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    try {
      final response = await dio.get(url +
          '/search/issues?q=' +
          Uri.encodeQueryComponent(query) +
          '&page=' +
          Uri.encodeQueryComponent(page));

      print(response);

      return IssueApiResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.headers['x-ratelimit-used']);
        if (e.response.headers['x-ratelimit-used'].toString() == '[10]') {
          throw ('limit exceeded');
        }
      } else {
        print(e.message);
      }
      throw ("error");
    }
  }

  Future<RepositoryApiResponse> searchRepositories(
      String page, String query) async {
    final String url = github_api_url;
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    try {
      final response = await dio.get(url +
          '/search/repositories?q=' +
          Uri.encodeQueryComponent(query) +
          '&page=' +
          Uri.encodeQueryComponent(page));

      print(response);

      return RepositoryApiResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.headers['x-ratelimit-used']);
        if (e.response.headers['x-ratelimit-used'].toString() == '[10]') {
          throw ('limit exceeded');
        }
      } else {
        print(e.message);
      }
      throw ("error");
    }
  }
}
