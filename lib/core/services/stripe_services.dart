import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:zingoshop/core/constants/api_link.dart';

class StripeServices {
  StripeServices._();
  static final StripeServices _instance = StripeServices._();
  static StripeServices get instance => _instance;

  Future<bool?> payWithStripe(String clientSecret) async {
    // Set up the payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'ZingoShop',
      ),
    );

    // Present the payment sheet to the user
    try {
      await Stripe.instance.presentPaymentSheet();
      // Payment succeeded
      print('Payment completed!');

      return true;
    } catch (e) {
      // Handle errors or failures
      print('Payment failed: $e');
    }
  }
}
