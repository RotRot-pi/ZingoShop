// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ecommercecourse/data/model/cart_item.dart';

class Cart {
  List<CartItem> cart;
  double totalPrice;

  Cart({
    required this.cart,
    required this.totalPrice,
  });

  Cart copyWith({
    List<CartItem>? cart,
    double? totalPrice,
  }) {
    return Cart(
      cart: cart ?? this.cart,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cart': cart.map((x) => x.toMap()).toList(),
      'totalPrice': totalPrice,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      cart: List<CartItem>.from(
        (map['cart'] as List<int>).map<CartItem>(
          (x) => CartItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalPrice: map['totalPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Cart(cart: $cart, totalPrice: $totalPrice)';

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;

    return listEquals(other.cart, cart) && other.totalPrice == totalPrice;
  }

  @override
  int get hashCode => cart.hashCode ^ totalPrice.hashCode;
}
