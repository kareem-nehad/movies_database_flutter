import 'package:movies_database_flutter/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException(this.errorMessageModel);
}
