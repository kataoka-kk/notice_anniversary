import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:notice_anniversary/models/model/AnniversaryModel.dart';
import 'package:notice_anniversary/viewmodels/UpdateViewModel.dart';
import 'package:notice_anniversary/views/bases/BasePinkCard.dart';
import 'package:notice_anniversary/views/components/AnniversaryTypeDropdown.dart';
import 'package:notice_anniversary/views/components/TitleTextField.dart';
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
                                    "${viewModel.selectDay.year}???/"
                                    "${viewModel.selectDay.month}???/"
                                    "${viewModel.selectDay.day}???",
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
                        child: const Text('??????'),
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
                                    Text("?????????${viewModel.dialogText}???????????????????????????"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      "???????????????",
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
}
