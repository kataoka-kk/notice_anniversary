import 'package:flutter/material.dart';
import 'package:notice_anniversary/viewmodels/ListViewModel.dart';
import 'package:notice_anniversary/views/components/AnniversaryTile.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ListViewModel>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink.shade50,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink.shade200,
          child: Icon(Icons.add),
          tooltip: "追加",
          onPressed: null,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
                Consumer<ListViewModel>(builder: (context, model, child) {
                  return listViewBuilder(model);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listViewBuilder(ListViewModel model) {
    //TODO: 一旦複数明細かつ、切り出しを行えた

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      // itemCount: model.articles.length,
      itemBuilder: (context, int position) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: AnniversaryTile(
          month: 12,
          day: 1,
          tag: "誕生日",
          title: "片岡康希の誕生日",
        ),
      ),
    );
  }
}
