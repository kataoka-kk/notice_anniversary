import 'package:flutter/material.dart';
import 'package:notice_anniversary/models/model/AnniversaryModel.dart';
import 'package:notice_anniversary/viewmodels/ListViewModel.dart';
import 'package:notice_anniversary/views/components/AnniversaryTile.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ListViewModel>();
    if (!viewModel.isLoad) {
      print("!viewModel.isLoad: init");
      viewModel.loadAnniversary();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink.shade50,
        floatingActionButton: Consumer<ListViewModel>(
          builder: (context, model, child) {
            return FloatingActionButton(
              backgroundColor: Colors.pink.shade200,
              child: Icon(Icons.add),
              tooltip: "追加",
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/Add',
                  arguments: model.anniversaries,
                  // arguments: setTest(),
                );
              },
            );
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
    print("Widget listViewBuilder(ListViewModel model)!!!!!!!!!");
    print(model.anniversaries.length);
    print(model.anniversaries);

    //TODO:こっちの方では行をタップすると'/Update'を呼び出す

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model.anniversaries.length,
      itemBuilder: (context, int position) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: AnniversaryTile(
          month: model.anniversaries[position].dateTime.month,
          day: model.anniversaries[position].dateTime.day,
          tag: model.anniversaries[position].tagNum,
          title: model.anniversaries[position].title,
        ),
      ),
    );

    //TODO 画面のテストコード
    // return ListView.builder(
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemCount: 10,
    //   itemBuilder: (context, int position) => Padding(
    //     padding: const EdgeInsets.all(4.0),
    //     child: AnniversaryTile(
    //       month: 12,
    //       day: 1,
    //       tag: 1,
    //       title: "片岡テスト誕生日",
    //     ),
    //   ),
    // );
  }

  //TODO テストコード
  List<Anniversary> setTest() {
    List<Anniversary> list = [];

    list.add(Anniversary(
        id: 99, title: "title", tagNum: 1, dateTime: DateTime.now()));
    return list;
  }
}
