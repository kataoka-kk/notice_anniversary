import 'package:flutter/material.dart';
import 'package:notice_anniversary/viewmodels/ListViewModel.dart';
import 'package:notice_anniversary/views/ScreenConst.dart';
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

    //TODO:list→updateの際にlistからの内容を引き継ぐ流れの実装
    //TODO:通知機能の追加
    //TODO:各コードのリファクタリングを行う

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
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model.anniversaries.length,
      itemBuilder: (context, int position) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          child: AnniversaryTile(
            month: model.anniversaries[position].dateTime.month,
            day: model.anniversaries[position].dateTime.day,
            tag: model.anniversaries[position].tagNum,
            title: model.anniversaries[position].title,
          ),
          onTap: () {
            ScreenConst.anniversary_id = model.anniversaries[position].id;
            Navigator.pushNamed(
              context,
              '/Update',
              arguments: model.anniversaries,
            );
          },
        ),
      ),
    );
  }
}
