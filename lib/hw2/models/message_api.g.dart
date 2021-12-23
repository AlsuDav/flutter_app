// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageApi _$MessageApiFromJson(Map<String, dynamic> json) {
  return MessageApi(
    author: json['author'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$MessageApiToJson(MessageApi instance) =>
    <String, dynamic>{
      'author': instance.author,
      'message': instance.message,
    };
