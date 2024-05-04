
class Coupon {
  int? couponId;
  String? couponName;
  dynamic couponDiscount;
  String? couponExpireDate;
  int? couponCount;

  Coupon(
      {this.couponId,
        this.couponName,
        this.couponDiscount,
        this.couponExpireDate,
        this.couponCount});

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      couponId: json['coupon_id'],
      couponName: json['coupon_name'],
      couponDiscount: json['coupon_discount'],
      couponExpireDate: json['coupon_expire_date'],
      couponCount: json['coupon_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_discount'] = this.couponDiscount;
    data['coupon_expire_date'] = this.couponExpireDate;
    data['coupon_count'] = this.couponCount;
    return data;
  }

  factory Coupon.fromMap(Map<String, dynamic> map) {
    return Coupon(
      couponId: map['coupon_id'],
      couponName: map['coupon_name'],
      couponDiscount: map['coupon_discount'],
      couponExpireDate: map['coupon_expire_date'],
      couponCount: map['coupon_count'],
    );
  }
}