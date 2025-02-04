
abstract class Failure {
  final String message;

  const Failure({required this.message});
}

class ServerFailure extends Failure {
  final String errorMessage;

  const ServerFailure({required this.errorMessage, required String message}) : super(message: errorMessage);
}