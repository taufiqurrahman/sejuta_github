import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sejuta_cita/bloc/search_bloc.dart';
import 'package:sejuta_cita/providers/search_provider.dart';

class Search extends StatelessWidget {
  const Search({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 35.0),
      margin: EdgeInsets.only(top: 10.0),
      child: Center(
        child: TextFormField(
          onChanged: (value) {
            context.read<SearchProvider>().updateQuery(value, notify: false);
            var _catActive = Provider.of<SearchProvider>(context, listen: false)
                .getCategoryActive;

            if (_catActive == 1) {
              context.read<SearchBloc>().add(SearchUser(value, '1'));
            } else if (_catActive == 2) {
              context.read<SearchBloc>().add(SearchIssues(value, '1'));
            } else if (_catActive == 3) {
              context.read<SearchBloc>().add(SearchRepositories(value, '1'));
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            isDense: true,
            prefixIcon: new Icon(
              Icons.search,
              color: Colors.blueGrey,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            filled: true,
            hintText: "Cari sesuatu",
            hintStyle: TextStyle(color: Colors.blueGrey),
            fillColor: Colors.grey[200],
          ),
        ),
      ),
    );
  }
}
