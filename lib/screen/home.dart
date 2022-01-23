import 'package:flutter/material.dart';
import 'package:sejuta_cita/components/category.dart';
import 'package:sejuta_cita/components/paging.dart';
import 'package:sejuta_cita/components/search.dart';
import 'package:sejuta_cita/components/search_result.dart';
import 'package:sejuta_cita/config/size_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeLayoutConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, _) => [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      backgroundColor: Colors.white,
                      floating: true,
                      snap: true,
                      title: Search(),
                    ),
                  )
                ],
            body: Container(
                color: Colors.white,
                // padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
                child: Builder(builder: (context) {
                  // var handle =
                  //     NestedScrollView.sliverOverlapAbsorberHandleFor(context);
                  return Column(
                    children: [
                      Category(),
                      PagingOption(),
                      Expanded(
                        child: Container(
                            child:
                                SingleChildScrollView(child: SearchResult())),
                      )
                    ],
                  );
                  print('test');
                }))),
      ),
    );
  }
}
