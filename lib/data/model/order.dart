class Order {
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

  Order(
      {this.orderId,
        this.orderAddressId,
        this.orderUserId,
        this.orderType,
        this.orderDeliveryPrice,
        this.orderCouponId,
        this.orderDateTime,
        this.orderPrice,
        this.orderTotalprice,
        this.orderPaymentType,
        this.orderStatus});

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderAddressId = json['order_address_id'];
    orderUserId = json['order_user_id'];
    orderType = json['order_type'];
    orderDeliveryPrice = json['order_delivery_price'];
    orderCouponId = json['order_coupon_id'];
    orderDateTime = json['order_date_time'];
    orderPrice = json['order_price'];
    orderTotalprice = json['order_totalprice'].toDouble() as double?;
    orderPaymentType = json['order_payment_type'];
    orderStatus = json['order_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_address_id'] = this.orderAddressId;
    data['order_user_id'] = this.orderUserId;
    data['order_type'] = this.orderType;
    data['order_delivery_price'] = this.orderDeliveryPrice;
    data['order_coupon_id'] = this.orderCouponId;
    data['order_date_time'] = this.orderDateTime;
    data['order_price'] = this.orderPrice;
    data['order_totalprice'] = this.orderTotalprice;
    data['order_payment_type'] = this.orderPaymentType;
    data['order_status'] = this.orderStatus;
    return data;
  }
}