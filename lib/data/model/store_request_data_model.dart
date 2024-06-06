class StoreRequestDataModel {
  String? institutionName;
  int? mobile;
  int? phone;
  String? email;
  int? establishYear;
  int? officeType;
  int? ownershipType;
  int? economicActivityType;
  int? maleWorkerCount;
  int? femaleWorkerCount;
  int? status;

  StoreRequestDataModel(
      {this.institutionName,
      this.mobile,
      this.phone,
      this.email,
      this.establishYear,
      this.officeType,
      this.ownershipType,
      this.economicActivityType,
      this.maleWorkerCount,
      this.femaleWorkerCount,
      this.status});

  StoreRequestDataModel.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    return data;
  }
}
