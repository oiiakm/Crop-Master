import 'package:cropmaster/features/weather/data/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.message) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;
  @override
  String toString() {
    return "status:$status\n message:$message";
  }
}
