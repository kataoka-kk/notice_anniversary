import 'package:flutter/material.dart';
import 'package:notice_anniversary/viewmodels/UpdateViewModel.dart';
import 'package:notice_anniversary/views/bases/BasePinkCard.dart';

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
