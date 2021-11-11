// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnniversaryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anniversary _$AnniversaryFromJson(Map<String, dynamic> json) => Anniversary(
      title: json['title'] as String,
      tagNum: json['tagNum'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$AnniversaryToJson(Anniversary instance) =>
    <String, dynamic>{
      'title': instance.title,
      'tagNum': instance.tagNum,
      'dateTime': instance.dateTime.toIso8601String(),
    };
