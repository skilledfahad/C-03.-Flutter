class NetworkResponse{

  final bool isSuccess;
  final int statusCode;
  final Map<String,dynamic>? body;

  NetworkResponse(this.isSuccess, this.statusCode, this.body);
}