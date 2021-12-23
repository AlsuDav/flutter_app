import 'package:json_annotation/json_annotation.dart';

part 'message_api.g.dart';

@JsonSerializable()
class MessageApi {
  MessageApi({
    required this.author,
    required this.message,
  });

  String author;
  String message;

  factory MessageApi.fromJson(Map<String, dynamic> json) => _$MessageApiFromJson(json);

  Map<String, dynamic> toJson() => _$MessageApiToJson(this);
}