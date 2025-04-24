class CommonResponse{
  bool? issuccess;
  num? statusCode;
  dynamic? payload;
  String? message;

  CommonResponse({this.issuccess, this.statusCode, this.payload, this.message});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    issuccess = json['issuccess'];
    statusCode = json['statusCode'];
    payload = json['payload'];
    message = json['message'];
  }
}