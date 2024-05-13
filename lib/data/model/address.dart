class Address {
  int? addressId;
  String? addressCity;
  String? addressName;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  int? addressUserId;

  Address(
      {this.addressId,
      this.addressCity,
      this.addressName,
      this.addressStreet,
      this.addressLat,
      this.addressLong,
      this.addressUserId});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressId: json['address_id'],
      addressCity: json['address_city'],
      addressName: json['address_name'],
      addressStreet: json['address_street'],
      addressLat: json['address_lat'].toDouble(),
      addressLong: json['address_long'].toDouble(),
      addressUserId: json['address_user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_city'] = this.addressCity;
    data['address_name'] = this.addressName;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_user_id'] = this.addressUserId;
    return data;
  }

  Address.fromMap(Map<String, dynamic> map) {
    addressId = map['address_id'];
    addressCity = map['address_city'];
    addressName = map['address_name'];
    addressStreet = map['address_street'];
    addressLat = map['address_lat'];
    addressLong = map['address_long'];
    addressUserId = map['address_user_id'];
  }
}
