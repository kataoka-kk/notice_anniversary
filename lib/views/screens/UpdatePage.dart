import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:notice_anniversary/models/model/AnniversaryModel.dart';
import 'package:notice_anniversary/viewmodels/UpdateViewModel.dart';
import 'package:notice_anniversary/views/components/BasePinkCard.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class UpdatePage extends StatelessWidget {
  final bool isUpdate;
  final int? anniversary_id;

  const UpdatePage({
    Key? key,
    required this.isUpdate,
    this.anniversary_id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<UpdateViewModel>();

    viewModel.anniversaries =
        ModalRoute.of(context)!.settings.arguments as List<Anniversary>;
    viewModel.setItems(isUpdate, anniversary_id);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink.shade50,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SingleChildScrollView(
            child: Consumer<UpdateViewModel>(
              builder: (context, model, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: anniversaryTypeDropdown(model),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: titleTextField(model),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: BasePinkCard(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: GestureDetector(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Icon(Icons.calendar_today,
                                        color: Colors.white),
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
                              ),
                            ),
                            onTap: () {
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
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 128.0,
                        vertical: 4.0,
                      ),
                      child: OutlinedButton(
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
                                title: Text(viewModel.dialogText),
                                content:
                                    Text("上記を${viewModel.dialogText}してもいいですか？"),
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
                                      viewModel.onEntry(anniversary_id);
                                      Navigator.popUntil(
                                        context,
                                        ModalRoute.withName("/"),
                                      );
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
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  //(記念日,誕生日,その他)のドロップダウンリスト
  Widget anniversaryTypeDropdown(UpdateViewModel model) {
    return BasePinkCard(
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
          style: const TextStyle(fontSize: 20, color: Colors.white),
          items: model.anniversaryItems,
          value: model.numAnniversary,
          onChanged: (int? selectedValue) {
            model.onDropdownChanged(selectedValue);
          },
        ),
      ),
    );
  }

  //タイトルのテキストフィールド
  Widget titleTextField(UpdateViewModel model) {
    final textController = TextEditingController();
    textController.text = model.contentTitle;

    return BasePinkCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextField(
          controller: textController,
          style: const TextStyle(fontSize: 20, color: Colors.white),
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
          onChanged: (value) {
            model.onTitleChanged(value);
          },
        ),
      ),
    );
  }
}
