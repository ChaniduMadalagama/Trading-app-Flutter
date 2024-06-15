class DaywiseDataModel {
  List<DaywiseData>? data;
  bool? status;
  String? message;

  DaywiseDataModel({this.data, this.status, this.message});

  DaywiseDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DaywiseData>[];
      json['data'].forEach((v) {
        data!.add(new DaywiseData.fromJson(v));
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

class DaywiseData {
  int? id;
  String? fllCall;
  String? fllPut;
  String? fllFutur;
  String? fllFuturOl;
  String? fllCash;
  String? dllCash;
  String? date;
  int? status;
  String? createdAt;
  String? updatedAt;

  DaywiseData(
      {this.id,
        this.fllCall,
        this.fllPut,
        this.fllFutur,
        this.fllFuturOl,
        this.fllCash,
        this.dllCash,
        this.date,
        this.status,
        this.createdAt,
        this.updatedAt});

  DaywiseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fllCall = json['fll_call'];
    fllPut = json['fll_put'];
    fllFutur = json['fll_futur'];
    fllFuturOl = json['fll_futur_ol'];
    fllCash = json['fll_cash'];
    dllCash = json['dll_cash'];
    date = json['date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fll_call'] = this.fllCall;
    data['fll_put'] = this.fllPut;
    data['fll_futur'] = this.fllFutur;
    data['fll_futur_ol'] = this.fllFuturOl;
    data['fll_cash'] = this.fllCash;
    data['dll_cash'] = this.dllCash;
    data['date'] = this.date;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
