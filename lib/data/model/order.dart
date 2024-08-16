import 'package:zingoshop/data/model/address.dart';

class Order extends Address {
  int? orderId;
  int? orderAddressId;
  int? orderUserId;
  int? orderType;
  int? orderDeliveryPrice;
  int? orderCouponId;
  String? orderDateTime;
  int? orderPrice;
  double? orderTotalprice;
  int? orderPaymentType;
  int? orderStatus;
  int? orderRating;
  String? orderNotating;

  Order({
    this.orderId,
    this.orderAddressId,
    this.orderUserId,
    this.orderType,
    this.orderDeliveryPrice,
    this.orderCouponId,
    this.orderDateTime,
    this.orderPrice,
    this.orderTotalprice,
    this.orderPaymentType,
    this.orderStatus,
    this.orderRating,
    this.orderNotating,
  });

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderAddressId = json['order_address_id'];
    orderUserId = json['order_user_id'];
    orderType = json['order_type'];
    orderDeliveryPrice = json['order_delivery_price'];
    orderCouponId = json['order_coupon_id'];
    orderDateTime = json['order_date_time'];
    orderPrice = json['order_price'];
    orderTotalprice = json['order_totalprice'].toDouble() as double;
    orderPaymentType = json['order_payment_type'];
    orderStatus = json['order_status'];
    orderRating = json['order_rating'];
    orderNotating = json['order_notating'];
    addressId = json['address_id'];
    addressCity = json['address_city'];
    addressName = json['address_name'];
    addressStreet = json['address_street'];
    if (json['address_lat'] != null) {
      addressLat = json['address_lat'].toDouble();
    } else {
      addressLat = null;
    }
    if (json['address_long'] != null) {
      addressLat = json['address_long'].toDouble();
    } else {
      addressLat = null;
    }
    addressUserId = json['address_user_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_address_id'] = orderAddressId;
    data['order_user_id'] = orderUserId;
    data['order_type'] = orderType;
    data['order_delivery_price'] = orderDeliveryPrice;
    data['order_coupon_id'] = orderCouponId;
    data['order_date_time'] = orderDateTime;
    data['order_price'] = orderPrice;
    data['order_totalprice'] = orderTotalprice;
    data['order_payment_type'] = orderPaymentType;
    data['order_status'] = orderStatus;
    return data;
  }
}
