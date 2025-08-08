
class BaseResponse<T> {
  final T? data;
  final bool? status;
  final String? message;

  factory BaseResponse.fromJson({
    required dynamic data,
    T Function(dynamic json)? decoder,
  }) {
    return BaseResponse(
        data: decoder?.call(data['data']),
        status: data["status"] ?? false,
        message: data["message"] ?? "");
  }


  @override
  String toString() {
    return 'BaseResponse{data: $data, status: $status, message: $message}';
  }

  BaseResponse(
      {required this.data,
      required this.status,
      required this.message,});
}

