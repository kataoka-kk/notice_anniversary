import 'package:flutter/material.dart';
import 'package:notice_anniversary/viewmodels/UpdateViewModel.dart';
import 'package:notice_anniversary/views/bases/BasePinkCard.dart';

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
