import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sejuta_cita/models/issue.dart';
import 'package:sejuta_cita/models/repository.dart';
import 'package:sejuta_cita/models/user.dart';
import 'package:sejuta_cita/repository/SearchRepository.dart';

class SearchBloc extends Bloc<UserEvent, UserState> {
  SearchBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is SearchUser) {
      try {
        if (event.query != '') {
          yield SearchUserLoading();

          SearchRepository _searchRepository;
          _searchRepository = SearchRepository();
          UserApiResponse _response =
              await _searchRepository.searchUser(event.page, event.query);

          if (_response is UserApiResponse) {
            yield SearchUserState(_response);
          } else {
            yield SearchUserLoading();
          }
        }
      } catch (e, stackTrace) {
        if (e.toString() == 'limit exceeded') {
          yield SearchUserLimitExceeded();
        } else {
          print("error");
          print(e.toString());
          print(stackTrace);
          yield SearchUserErrorState(e.toString());
        }
      }
    } else if (event is SearchIssues) {
      try {
        if (event.query != '') {
          yield SearchUserLoading();

          SearchRepository _searchRepository;
          _searchRepository = SearchRepository();
          IssueApiResponse _response =
              await _searchRepository.searchIssues(event.page, event.query);

          if (_response is IssueApiResponse) {
            yield SearchIssuesState(_response);
          } else {
            yield SearchUserLoading();
          }
        }
      } catch (e, stackTrace) {
        if (e.toString() == 'limit exceeded') {
          yield SearchUserLimitExceeded();
        } else {
          print("error");
          print(e.toString());
          print(stackTrace);
          yield SearchUserErrorState(e.toString());
        }
      }
    } else if (event is SearchRepositories) {
      try {
        if (event.query != '') {
          yield SearchUserLoading();

          SearchRepository _searchRepository;
          _searchRepository = SearchRepository();
          RepositoryApiResponse _response = await _searchRepository
              .searchRepositories(event.page, event.query);

          if (_response is RepositoryApiResponse) {
            yield SearchRepositorieState(_response);
          } else {
            yield SearchUserLoading();
          }
        }
      } catch (e, stackTrace) {
        if (e.toString() == 'limit exceeded') {
          yield SearchUserLimitExceeded();
        } else {
          print("error");
          print(e.toString());
          print(stackTrace);
          yield SearchUserErrorState(e.toString());
        }
      }
    }
  }
}

class UserState {
  const UserState();
}

class UserInitial extends UserState {}

class SearchUserLoading extends UserState {}

class SearchUserLimitExceeded extends UserState {}

class SearchUserState extends UserState {
  final UserApiResponse data;

  SearchUserState(this.data);
}

class SearchIssuesState extends UserState {
  final IssueApiResponse data;

  SearchIssuesState(this.data);
}

class SearchRepositorieState extends UserState {
  final RepositoryApiResponse data;

  SearchRepositorieState(this.data);
}

class SearchUserErrorState extends UserState {
  final String message;

  SearchUserErrorState(this.message);
}

/* ----------------------------- */

class UserEvent {
  const UserEvent();
}

class SearchUser extends UserEvent {
  String query, page;
  SearchUser(this.query, this.page);
}

class SearchIssues extends UserEvent {
  String query, page;
  SearchIssues(this.query, this.page);
}

class SearchRepositories extends UserEvent {
  String query, page;
  SearchRepositories(this.query, this.page);
}
