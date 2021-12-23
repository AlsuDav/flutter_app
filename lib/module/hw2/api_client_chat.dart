import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'models/message_api.dart';



part 'api_client_chat.g.dart';

@RestApi(baseUrl: "https://itis-chat-app-ex.herokuapp.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/chat")
  Future<List<MessageApi>> getMessages();

  @POST("/chat")
  Future<MessageApi> sendMessage(@Body() MessageApi message);
}