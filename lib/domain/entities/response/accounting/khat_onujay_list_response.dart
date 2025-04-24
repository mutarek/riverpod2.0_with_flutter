class KhatOnujayListResponse {
  bool? issuccess;
  num? statusCode;
  List<Payload>? payload;
  String? message;

  KhatOnujayListResponse(
      {this.issuccess, this.statusCode, this.payload, this.message});

  KhatOnujayListResponse.fromJson(Map<String, dynamic> json) {
    issuccess = json['issuccess'];
    statusCode = json['statusCode'];
    if (json['payload'] != null) {
      payload = <Payload>[];
      json['payload'].forEach((v) {
        payload!.add(new Payload.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['issuccess'] = this.issuccess;
    data['statusCode'] = this.statusCode;
    if (this.payload != null) {
      data['payload'] = this.payload!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Payload {
  String? id;
  String? name;
  num? amount;

  Payload({this.id, this.name, this.amount});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['amount'] = this.amount;
    return data;
  }
}