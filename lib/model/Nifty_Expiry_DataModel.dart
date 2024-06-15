class NiftyExpriyDataModel {
  List<NiftyExpriyData>? data;
  bool? status;
  String? message;

  NiftyExpriyDataModel({this.data, this.status, this.message});

  NiftyExpriyDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NiftyExpriyData>[];
      json['data'].forEach((v) {
        data!.add(new NiftyExpriyData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class NiftyExpriyData {
  int? id;
  String? startDate;
  String? endDate;
  String? type;
  int? status;
  String? createdAt;
  String? updatedAt;

  NiftyExpriyData(
      {this.id,
        this.startDate,
        this.endDate,
        this.type,
        this.status,
        this.createdAt,
        this.updatedAt});

  NiftyExpriyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['type'] = this.type;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
