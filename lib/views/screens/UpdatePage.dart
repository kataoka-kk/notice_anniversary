import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:notice_anniversary/viewmodels/UpdateViewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class UpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<UpdateViewModel>();
    if (!viewModel.isInit) {
      print("!viewModel.isInit: init");
      viewModel.setItems();
    }

    //TODO 11/18～UpdatePageに追加機能の作成

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink.shade50,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  //TODO:このカードはピンクカードとして基底クラスの作成をする
                  // AnniversaryTileのカードもそうしたい
                  child: Consumer<UpdateViewModel>(
                    builder: (context, model, child) {
                      return Card(
                        elevation: 8.0,
                        color: Colors.pink.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: DropdownButton(
                            underline: Container(
                              color: Colors.white,
                              height: 1,
                            ),
                            dropdownColor: Colors.pink.shade100,
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.white,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                            items: viewModel.anniversaryItems,
                            value: viewModel.numAnniversary,
                            onChanged: (int? selectedValue) {
                              viewModel.onChanged(selectedValue);
                            },
                          ),
                        ),
                      );
                    },
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
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextField(
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                        maxLength: 8,
                        maxLines: 1,
                        decoration: const InputDecoration(
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
                          hintStyle: const TextStyle(color: Colors.white),
                          labelText: "タイトル",
                          labelStyle: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                          counterStyle: const TextStyle(color: Colors.white),
                        ),
                      ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Consumer<UpdateViewModel>(
                        builder: (context, model, child) {
                          return Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.calendar_today,
                                    color: Colors.white),
                                onPressed: () {
                                  DatePicker.showDatePicker(
                                    context,
                                    minTime: DateTime(1900, 1, 1),
                                    maxTime: DateTime(2049, 12, 31),
                                    currentTime: viewModel.selectDay,
                                    locale: LocaleType.jp,
                                    onConfirm: (date) {
                                      viewModel.onConfirm(date);
                                    },
                                  );
                                },
                              ),
                              Text(
                                "${viewModel.selectDay.year}年/"
                                "${viewModel.selectDay.month}月/"
                                "${viewModel.selectDay.day}日",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 128.0, vertical: 4.0),
                  child: Consumer<UpdateViewModel>(
                    builder: (context, model, child) {
                      return OutlinedButton(
                        child: const Text('登録'),
                        style: OutlinedButton.styleFrom(
                          elevation: 8.0,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20.0),
                          shape: const StadiumBorder(),
                          side: const BorderSide(color: Colors.transparent),
                          backgroundColor: Colors.pink.shade100,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text(viewModel.contentText),
                                content: Text(
                                    "上記を${viewModel.contentText}してもいいですか？"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      "キャンセル",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      viewModel.onEntry();
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "OK",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
