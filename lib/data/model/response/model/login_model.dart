class LoginModel {
  bool status;
  Data data;
  String message;

  LoginModel({required this.status, required this.data, required this.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      data: Data.fromJson(json['data']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
      'message': message,
    };
  }
}

class Data {
  String token;
  int id;
  String name;
  String email;
  String mobile;
  String enumeratorNo;
  String? zoneId;
  Zone zone;
  int expiresIn;

  Data({
    required this.token,
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.enumeratorNo,
    required this.zoneId,
    required this.zone,
    required this.expiresIn,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      enumeratorNo: json['enumerator_no'],
      zoneId: json['zone_id'],
      zone: Zone.fromJson(json['zone']),
      expiresIn: json['expires_in'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'enumerator_no': enumeratorNo,
      'zone_id': zoneId,
      'zone': zone.toJson(),
      'expires_in': expiresIn,
    };
  }
}

class Zone {
  int id;
  String zoneName;
  int officeId;
  int divisionId;
  int districtId;
  int cityCorporationId;
  dynamic upazilaId;
  dynamic municipalId;
  dynamic unionId;
  int cityWardId;
  dynamic municipalWardId;
  dynamic village;
  dynamic area;
  dynamic latitude;
  dynamic longitude;
  dynamic listingNo;
  int status;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  Office office;
  Division division;
  District district;
  CityCorporation cityCorporation;
  String? upazila;
  dynamic municipal;
  dynamic union;
  CityWard cityWard;
  dynamic municipalWard;

  Zone({
    required this.id,
    required this.zoneName,
    required this.officeId,
    required this.divisionId,
    required this.districtId,
    required this.cityCorporationId,
    this.upazilaId,
    this.municipalId,
    this.unionId,
    required this.cityWardId,
    this.municipalWardId,
    this.village,
    this.area,
    this.latitude,
    this.longitude,
    this.listingNo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.office,
    required this.division,
    required this.district,
    required this.cityCorporation,
    this.upazila,
    this.municipal,
    this.union,
    required this.cityWard,
    this.municipalWard,
  });

  factory Zone.fromJson(Map<String, dynamic> json) {
    return Zone(
      id: json['id'],
      zoneName: json['zone_name'],
      officeId: json['office_id'],
      divisionId: json['division_id'],
      districtId: json['district_id'],
      cityCorporationId: json['city_corporation_id'],
      upazilaId: json['upazila_id'],
      municipalId: json['municipal_id'],
      unionId: json['union_id'],
      cityWardId: json['city_ward_id'],
      municipalWardId: json['municipal_ward_id'],
      village: json['village'],
      area: json['area'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      listingNo: json['listing_no'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      office: Office.fromJson(json['office']),
      division: Division.fromJson(json['division']),
      district: District.fromJson(json['district']),
      cityCorporation: CityCorporation.fromJson(json['city_corporation']),
      upazila: json['upazila'],
      municipal: json['municipal'],
      union: json['union'],
      cityWard: CityWard.fromJson(json['city_ward']),
      municipalWard: json['municipal_ward'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'zone_name': zoneName,
      'office_id': officeId,
      'division_id': divisionId,
      'district_id': districtId,
      'city_corporation_id': cityCorporationId,
      'upazila_id': upazilaId,
      'municipal_id': municipalId,
      'union_id': unionId,
      'city_ward_id': cityWardId,
      'municipal_ward_id': municipalWardId,
      'village': village,
      'area': area,
      'latitude': latitude,
      'longitude': longitude,
      'listing_no': listingNo,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'office': office.toJson(),
      'division': division.toJson(),
      'district': district.toJson(),
      'city_corporation': cityCorporation.toJson(),
      'upazila': upazila,
      'municipal': municipal,
      'union': union,
      'city_ward': cityWard.toJson(),
      'municipal_ward': municipalWard,
    };
  }
}

class Office {
  int id;
  String officeName;
  String officeNameEn;
  dynamic location;
  int divisionId;
  int districtId;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Office({
    required this.id,
    required this.officeName,
    required this.officeNameEn,
    this.location,
    required this.divisionId,
    required this.districtId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      id: json['id'],
      officeName: json['office_name'],
      officeNameEn: json['office_name_en'],
      location: json['location'],
      divisionId: json['division_id'],
      districtId: json['district_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'office_name': officeName,
      'office_name_en': officeNameEn,
      'location': location,
      'division_id': divisionId,
      'district_id': districtId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}

class Division {
  int id;
  String name;
  String nameBn;
  String latitude;
  String longitude;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic latitudeDirection;
  dynamic longitudeDirection;
  int mapId;

  Division({
    required this.id,
    required this.name,
    required this.nameBn,
    required this.latitude,
    required this.longitude,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.latitudeDirection,
    this.longitudeDirection,
    required this.mapId,
  });

  factory Division.fromJson(Map<String, dynamic> json) {
    return Division(
      id: json['id'],
      name: json['name'],
      nameBn: json['name_bn'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      latitudeDirection: json['latitude_direction'],
      longitudeDirection: json['longitude_direction'],
      mapId: json['MapId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_bn': nameBn,
      'latitude': latitude,
      'longitude': longitude,
      'deleted_at': deletedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'latitude_direction': latitudeDirection,
      'longitude_direction': longitudeDirection,
      'MapId': mapId,
    };
  }
}

class District {
  int id;
  int divisionId;
  int circleId;
  String name;
  String nameBn;
  String latitude;
  String longitude;
  dynamic deletedAt;
  dynamic createdAt;
  String updatedAt;
  dynamic latitudeDirection;
  dynamic longitudeDirection;
  int mapId;

  District({
    required this.id,
    required this.divisionId,
    required this.circleId,
    required this.name,
    required this.nameBn,
    required this.latitude,
    required this.longitude,
    this.deletedAt,
    this.createdAt,
    required this.updatedAt,
    this.latitudeDirection,
    this.longitudeDirection,
    required this.mapId,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'],
      divisionId: json['division_id'],
      circleId: json['circle_id'],
      name: json['name'],
      nameBn: json['name_bn'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      latitudeDirection: json['latitude_direction'],
      longitudeDirection: json['longitude_direction'],
      mapId: json['MapId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'division_id': divisionId,
      'circle_id': circleId,
      'name': name,
      'name_bn': nameBn,
      'latitude': latitude,
      'longitude': longitude,
      'deleted_at': deletedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'latitude_direction': latitudeDirection,
      'longitude_direction': longitudeDirection,
      'MapId': mapId,
    };
  }
}

class CityCorporation {
  int id;
  int districtId;
  String name;
  dynamic nameBn;
  String latitude;
  String longitude;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;
  dynamic latitudeDirection;
  dynamic longitudeDirection;

  CityCorporation({
    required this.id,
    required this.districtId,
    required this.name,
    this.nameBn,
    required this.latitude,
    required this.longitude,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    this.latitudeDirection,
    this.longitudeDirection,
  });

  factory CityCorporation.fromJson(Map<String, dynamic> json) {
    return CityCorporation(
      id: json['id'],
      districtId: json['district_id'],
      name: json['name'],
      nameBn: json['name_bn'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      latitudeDirection: json['latitude_direction'],
      longitudeDirection: json['longitude_direction'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'district_id': districtId,
      'name': name,
      'name_bn': nameBn,
      'latitude': latitude,
      'longitude': longitude,
      'deleted_at': deletedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'latitude_direction': latitudeDirection,
      'longitude_direction': longitudeDirection,
    };
  }
}

class CityWard {
  int id;
  int cityCorporationId;
  String wordNo;
  dynamic latitude;
  dynamic longitude;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  CityWard({
    required this.id,
    required this.cityCorporationId,
    required this.wordNo,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory CityWard.fromJson(Map<String, dynamic> json) {
    return CityWard(
      id: json['id'],
      cityCorporationId: json['city_corporation_id'],
      wordNo: json['word_no'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'city_corporation_id': cityCorporationId,
      'word_no': wordNo,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}
