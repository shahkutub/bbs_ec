class InfoDataFields {
  static final List<String> values = [
    /// Add all fields
    id, institution_name, mobile, phone, email, establish_year, office_type,
    ownership_type, economic_activity_type, male_worker_count,
    female_worker_count, status, server, date_time, latitude, longitude,
  ];

  static final String id = 'id';
  static final String institution_name = 'institution_name';
  static final String mobile = 'mobile';
  static final String phone = 'phone';
  static final String email = 'email';
  static final String establish_year = 'establish_year';
  static final String office_type = 'office_type';
  static final String ownership_type = 'ownership_type';
  static final String economic_activity_type = 'economic_activity_type';
  static final String male_worker_count = 'male_worker_count';
  static final String female_worker_count = 'female_worker_count';
  static final String status = 'status';
  static final String server = 'server';
  static final String date_time = 'date_time';
  static final String latitude = 'latitude';
  static final String longitude = 'longitude';
}

class InfoData {
  final int? id;
  final String? institutionName;
  final String? mobile;
  final String? phone;
  final String? email;
  final String? establishYear;
  final int? officeType;
  final int? ownershipType;
  final int? economicActivityType;
  final int? maleWorkerCount;
  final int? femaleWorkerCount;
  final int? status;
  final bool? server;
  final String? dateTime;
  final String? latitude;
  final String? longitude;
  const InfoData(
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
      this.server,
      this.dateTime,
      this.latitude,
      this.longitude});
  InfoData copy({
    int? id,
    String? institutionName,
    String? mobile,
    String? phone,
    String? email,
    String? establishYear,
    int? officeType,
    int? ownershipType,
    int? economicActivityType,
    int? maleWorkerCount,
    int? femaleWorkerCount,
    int? status,
    bool? server,
    String? dateTime,
    String? latitude,
    String? longitude,
  }) =>
      InfoData(
        id: id ?? this.id,
        institutionName: institutionName ?? this.institutionName,
        mobile: mobile ?? this.mobile,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        establishYear: establishYear ?? this.establishYear,
        officeType: officeType ?? this.officeType,
        ownershipType: ownershipType ?? this.ownershipType,
        economicActivityType: economicActivityType ?? this.economicActivityType,
        maleWorkerCount: maleWorkerCount ?? this.maleWorkerCount,
        femaleWorkerCount: femaleWorkerCount ?? this.femaleWorkerCount,
        status: status ?? this.status,
        server: server ?? this.server,
        dateTime: dateTime ?? this.dateTime,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );
  static InfoData fromJson(Map<String, dynamic> json) => InfoData(
        id: json[InfoDataFields.id],
        institutionName: json[InfoDataFields.institution_name],
        mobile: json[InfoDataFields.mobile],
        phone: json[InfoDataFields.phone],
        email: json[InfoDataFields.email],
        establishYear: json[InfoDataFields.establish_year],
        officeType: json[InfoDataFields.office_type],
        ownershipType: json[InfoDataFields.ownership_type],
        economicActivityType: json[InfoDataFields.economic_activity_type],
        maleWorkerCount: json[InfoDataFields.male_worker_count],
        femaleWorkerCount: json[InfoDataFields.female_worker_count],
        status: json[InfoDataFields.status],
        server: json[InfoDataFields.server] == 0 ? false : true,
        dateTime: json[InfoDataFields.date_time],
        latitude: json[InfoDataFields.latitude],
        longitude: json[InfoDataFields.longitude],
      );
  Map<String, Object?> toJson() => {
        InfoDataFields.institution_name: institutionName,
        InfoDataFields.mobile: mobile,
        InfoDataFields.phone: phone,
        InfoDataFields.email: email,
        InfoDataFields.establish_year: establishYear,
        InfoDataFields.office_type: officeType,
        InfoDataFields.ownership_type: ownershipType,
        InfoDataFields.economic_activity_type: economicActivityType,
        InfoDataFields.male_worker_count: maleWorkerCount,
        InfoDataFields.female_worker_count: femaleWorkerCount,
        InfoDataFields.status: status,
        InfoDataFields.server: (server ?? false) ? 1 : 0,
        InfoDataFields.date_time: dateTime,
        InfoDataFields.latitude: latitude,
        InfoDataFields.longitude: longitude
      };
  Map<String, Object?> toLocalJson() => {
        InfoDataFields.id: id,
        InfoDataFields.institution_name: institutionName,
        InfoDataFields.mobile: mobile,
        InfoDataFields.phone: phone,
        InfoDataFields.email: email,
        InfoDataFields.establish_year: establishYear,
        InfoDataFields.office_type: officeType,
        InfoDataFields.ownership_type: ownershipType,
        InfoDataFields.economic_activity_type: economicActivityType,
        InfoDataFields.male_worker_count: maleWorkerCount,
        InfoDataFields.female_worker_count: femaleWorkerCount,
        InfoDataFields.status: status,
        InfoDataFields.server: (server ?? false) ? 1 : 0,
        InfoDataFields.date_time: dateTime,
        InfoDataFields.latitude: latitude,
        InfoDataFields.longitude: longitude
      };
}
