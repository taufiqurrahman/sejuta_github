import 'package:flutter/material.dart';
import 'package:sejuta_cita/config/size_layout.dart';

class PagingOption extends StatelessWidget {
  const PagingOption({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: SizeLayoutConfig.blockSizeHorizontal * 10),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        PagingList(title: 'Lazy Loading', active: true, onTap: () {}),
        PagingList(title: 'With Index', active: false, onTap: () {}),
      ]),
    );
  }
}

class PagingList extends StatelessWidget {
  const PagingList(
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
    return Container(
        margin: EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.grey[600]),
            borderRadius: BorderRadius.circular(5.0),
            color: active ? Colors.grey[600] : Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: active ? Colors.white : Colors.grey[600]),
          ),
        ));
  }
}
