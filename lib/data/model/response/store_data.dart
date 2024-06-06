class StoreDataModel {
  bool? status;
  List<Data>? data;

  StoreDataModel({this.status, this.data});

  StoreDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? institutionName;
  String? mobile;
  String? phone;
  String? email;
  String? establishYear;
  int? officeType;
  int? ownershipType;
  int? economicActivityType;
  int? maleWorkerCount;
  int? femaleWorkerCount;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Data(
      {this.id,
      this.institutionName,
      this.mobile,
      this.phone,
      this.email,
      this.establishYear,
      this.officeType,
      this.ownershipType,
      this.economicActivityType,
      this.maleWorkerCount,
      this.femaleWorkerCount,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    institutionName = json['institution_name'];
    mobile = json['mobile'];
    phone = json['phone'];
    email = json['email'];
    establishYear = json['establish_year'];
    officeType = json['office_type'];
    ownershipType = json['ownership_type'];
    economicActivityType = json['economic_activity_type'];
    maleWorkerCount = json['male_worker_count'];
    femaleWorkerCount = json['female_worker_count'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['institution_name'] = this.institutionName;
    data['mobile'] = this.mobile;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['establish_year'] = this.establishYear;
    data['office_type'] = this.officeType;
    data['ownership_type'] = this.ownershipType;
    data['economic_activity_type'] = this.economicActivityType;
    data['male_worker_count'] = this.maleWorkerCount;
    data['female_worker_count'] = this.femaleWorkerCount;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
