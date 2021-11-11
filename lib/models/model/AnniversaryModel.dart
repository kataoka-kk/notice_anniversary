import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'AnniversaryModel.g.dart';

@JsonSerializable()
class Anniversary {
  final String title;
  final int tagNum;
  final DateTime dateTime;

  Anniversary({
    required this.title,
    required this.tagNum,
    required this.dateTime,
  });

  factory Anniversary.fromJson(Map<String, dynamic> json) =>
      _$AnniversaryFromJson(json);

  Map<String, dynamic> toJson() => _$AnniversaryToJson(this);

  String toJsonString() => jsonEncode(toJson());

  static Anniversary fromJsonString(String jsonString) =>
      Anniversary.fromJson(jsonDecode(jsonString));
}
