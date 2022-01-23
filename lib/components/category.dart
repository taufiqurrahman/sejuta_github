import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sejuta_cita/bloc/search_bloc.dart';
import 'package:sejuta_cita/config/size_layout.dart';
import 'package:sejuta_cita/providers/search_provider.dart';

class Category extends StatelessWidget {
  const Category({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0, top: 15.0),
      padding: EdgeInsets.symmetric(
          horizontal: SizeLayoutConfig.blockSizeHorizontal * 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        CategoryList(
            title: 'User',
            active: context.watch<SearchProvider>().getCategoryActive == 1
                ? true
                : false,
            onTap: () {
              context.read<SearchProvider>().changeCategorActive(1);
              context.read<SearchBloc>().add(SearchUser(
                  Provider.of<SearchProvider>(context, listen: false).getQuery,
                  '1'));
            }),
        CategoryList(
            title: 'Issues',
            active: context.watch<SearchProvider>().getCategoryActive == 2
                ? true
                : false,
            onTap: () {
              context.read<SearchProvider>().changeCategorActive(2);
              context.read<SearchBloc>().add(SearchIssues(
                  Provider.of<SearchProvider>(context, listen: false).getQuery,
                  '1'));
            }),
        CategoryList(
            title: 'Repositories',
            active: context.watch<SearchProvider>().getCategoryActive == 3
                ? true
                : false,
            onTap: () {
              context.read<SearchProvider>().changeCategorActive(3);
              context.read<SearchBloc>().add(SearchRepositories(
                  Provider.of<SearchProvider>(context, listen: false).getQuery,
                  '1'));
            }),
      ]),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList(
      {Key key,
      @required this.title,
      @required this.active,
      @required this.onTap})
      : super(key: key);

  final String title;
  final bool active;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8.0),
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                  color: active == true ? Colors.grey[600] : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.grey[600])),
            ),
            Container(margin: EdgeInsets.only(right: 15.0), child: Text(title))
          ],
        ),
      ),
    );
  }
}
