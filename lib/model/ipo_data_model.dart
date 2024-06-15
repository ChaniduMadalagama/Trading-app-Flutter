class IpoDataModel {
    List<IpoDataModelData>? data;
    bool? status;
    String? message;

  IpoDataModel({this.data, this.status, this.message});

  IpoDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <IpoDataModelData>[];
      json['data'].forEach((v) {
        data!.add(new IpoDataModelData.fromJson(v));
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

class IpoDataModelData {
  int? id;
  String? name;
  double? startPrice;
  double? endPrice;
  String? startDate;
  String? endDate;
  int? status;
  String? createdAt;
  String? updatedAt;

  IpoDataModelData(
      {this.id,
        this.name,
        this.startPrice,
        this.endPrice,
        this.startDate,
        this.endDate,
        this.status,
        this.createdAt,
        this.updatedAt});

  IpoDataModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startPrice = json['start_price'];
    endPrice = json['end_price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['start_price'] = this.startPrice;
    data['end_price'] = this.endPrice;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
