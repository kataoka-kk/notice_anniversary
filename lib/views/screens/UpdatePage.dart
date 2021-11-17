import 'package:flutter/material.dart';
import 'package:notice_anniversary/viewmodels/UpdateViewModel.dart';
import 'package:provider/src/provider.dart';

class UpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<UpdateViewModel>();
    if (!viewModel.isInit) {
      print("!viewModel.isInit: init");
      viewModel.setItems();
    }

    //TODO 11/16～UpdatePageの作業をしていく
    // ✓タイトルフィールドの作成
    // 何月何日のフィールドの作成
    // ラベル（記念日、誕生日、その他）選択の作成

    //TODO:return ChangeNotifierProviderしてないから値が変わっても通知されていない恐れがあり。
    //DropdownButtonが反応しない。

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink.shade50,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: DropdownButton(
                  items: viewModel.anniversaryItems,
                  value: viewModel.numAnniversary,
                  onChanged: (int? selectedValue) {
                    viewModel.onChanged(selectedValue);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              //TODO:このカードはピンクカードとして基底クラスの作成をする
              // AnniversaryTileのカードもそうしたい
              child: Card(
                elevation: 8.0,
                color: Colors.pink.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextField(
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    maxLength: 8,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.title,
                        color: Colors.white,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      hintText: "例:○○の誕生日、××記念日",
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: "タイトル",
                      labelStyle: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      counterStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "UpdatePage",
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
