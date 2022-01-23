import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sejuta_cita/bloc/search_bloc.dart';
import 'package:sejuta_cita/config/size_layout.dart';
import 'package:sejuta_cita/models/issue.dart';
import 'package:sejuta_cita/models/repository.dart';
import 'package:sejuta_cita/models/user.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeLayoutConfig.blockSizeHorizontal * 10),
      child: Column(children: [
        BlocBuilder<SearchBloc, UserState>(builder: (context, state) {
          if (state is SearchUserState) {
            var _searchResult = state.data.user;
            if (_searchResult.length == 0) {
              return Center(
                child: Container(
                  margin: EdgeInsets.only(top: 25.0),
                  child: Text('Data not found'),
                ),
              );
            } else {
              return Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Column(children: [
                    ...List.generate(
                        _searchResult.length,
                        (index) => CardItem(
                            data: _searchResult[index],
                            active: true,
                            onTap: () {}))
                  ]));
            }
          } else if (state is SearchIssuesState) {
            var _searchResult = state.data.issue;

            if (_searchResult.length == 0) {
              return Center(
                child: Container(
                  margin: EdgeInsets.only(top: 25.0),
                  child: Text('Data not found'),
                ),
              );
            } else {
              // return Container();
              return Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Column(children: [
                    ...List.generate(
                        _searchResult.length,
                        (index) => IssueCardItem(
                            data: _searchResult[index],
                            active: true,
                            onTap: () {}))
                  ]));
            }
          } else if (state is SearchRepositorieState) {
            var _searchResult = state.data.repository;

            if (_searchResult.length == 0) {
              return Center(
                child: Container(
                  margin: EdgeInsets.only(top: 25.0),
                  child: Text('Data not found'),
                ),
              );
            } else {
              // return Container();
              return Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Column(children: [
                    ...List.generate(
                        _searchResult.length,
                        (index) => RepositoryCardItem(
                            data: _searchResult[index],
                            active: true,
                            onTap: () {}))
                  ]));
            }
          } else if (state is SearchUserLimitExceeded) {
            return Center(
              child: Container(
                margin: EdgeInsets.only(top: 25.0),
                child: Text(
                  'API rate limit exceeded',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          } else if (state is SearchUserLoading) {
            return Center(
              child: Container(
                margin: EdgeInsets.only(top: 25.0),
                child: Text('Searching..'),
              ),
            );
          } else {
            return Container();
          }
        }),
      ]),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem(
      {Key key,
      @required this.data,
      @required this.active,
      @required this.onTap})
      : super(key: key);

  final User data;
  final bool active;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            Container(
              color: Colors.grey,
              height: SizeLayoutConfig.blockSizeHorizontal * 30,
              width: SizeLayoutConfig.blockSizeHorizontal * 30,
              child: Center(
                  child: Image.network(data.avatarUrl,
                      fit: BoxFit.cover, width: double.infinity)),
            ),
            Container(
              width: SizeLayoutConfig.blockSizeHorizontal * 120,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(data.nickname),
            ),
          ],
        ));
  }
}

class IssueCardItem extends StatelessWidget {
  const IssueCardItem(
      {Key key,
      @required this.data,
      @required this.active,
      @required this.onTap})
      : super(key: key);

  final Issue data;
  final bool active;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    print(data.avatarUrl);
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            Container(
              color: Colors.grey,
              height: SizeLayoutConfig.blockSizeHorizontal * 30,
              width: SizeLayoutConfig.blockSizeHorizontal * 30,
              child: Center(
                  child: Image.network(data.avatarUrl,
                      fit: BoxFit.cover, width: double.infinity)),
            ),
            Container(
              width: SizeLayoutConfig.blockSizeHorizontal * 120,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0)),
                  Text(data.date),
                ],
              ),
            ),
            Container(
              width: SizeLayoutConfig.blockSizeHorizontal * 30,
              child: Center(
                child: Text(
                  data.state != null ? data.state : '',
                  style: TextStyle(backgroundColor: Colors.green[300]),
                ),
              ),
            )
          ],
        ));
  }
}

class RepositoryCardItem extends StatelessWidget {
  const RepositoryCardItem(
      {Key key,
      @required this.data,
      @required this.active,
      @required this.onTap})
      : super(key: key);

  final Repository data;
  final bool active;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            Container(
              color: Colors.grey,
              height: SizeLayoutConfig.blockSizeHorizontal * 30,
              width: SizeLayoutConfig.blockSizeHorizontal * 30,
              child: Center(
                  child: Image.network(data.avatarUrl,
                      fit: BoxFit.cover, width: double.infinity)),
            ),
            Container(
              width: SizeLayoutConfig.blockSizeHorizontal * 120,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0)),
                  Text(data.dateCreated),
                ],
              ),
            ),
            Container(
              width: SizeLayoutConfig.blockSizeHorizontal * 30,
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.remove_red_eye, size: 14.0),
                        Text(
                          ' ' + data.watchers,
                          style: TextStyle(
                              color: Colors.blue[300], fontSize: 11.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.star_outlined, size: 14.0),
                        Text(
                          ' ' + data.stars,
                          style: TextStyle(
                              color: Colors.yellow[600], fontSize: 11.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.account_tree_outlined, size: 14.0),
                        Text(
                          ' ' + data.forks,
                          style: TextStyle(
                              color: Colors.green[300], fontSize: 11.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
