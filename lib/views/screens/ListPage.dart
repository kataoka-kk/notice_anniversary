import 'package:flutter/material.dart';
import 'package:notice_anniversary/viewmodels/ListViewModel.dart';
import 'package:notice_anniversary/views/components/AnniversaryTile.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ListViewModel>();
    if (!viewModel.isLoad) {
      //TODO
      print("!viewModel.isLoad: init");
      viewModel.loadAnniversary();
    }

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
    print("Widget listViewBuilder(ListViewModel model)!!!!!!!!!");
    print(model.anniversaries.length);
    print(model.anniversaries);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model.anniversaries.length,
      itemBuilder: (context, int position) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: AnniversaryTile(
          month: model.anniversaries[position].dateTime.month,
          day: model.anniversaries[position].dateTime.day,
          tag: model.anniversaries[position].tagNum,
          title: model.anniversaries[position].title,
        ),
      ),
    );
  }
}
