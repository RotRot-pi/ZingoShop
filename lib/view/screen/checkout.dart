import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zingoshop/controller/checkout_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/image_assets.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import '../widgets/checkout/carddeliveerytype.dart';
import '../widgets/checkout/cardpaymentmethod.dart';
import '../widgets/checkout/cardshippingaddress.dart';
import '../widgets/handeling_data_view.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text('checkout'.tr,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.white)),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => HandelingDataView(
          requestStatus: controller.statusRequest,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader("choose_payment_method".tr),
                _buildPaymentMethods(controller),
                _buildSectionHeader("choose_delivery_type".tr),
                _buildDeliveryTypes(controller),
                if (controller.deliveryType == 0)
                  _buildShippingAddress(controller),
                const SizedBox(height: 20),
                _buildOrderSummary(controller),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildCheckoutButton(controller),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildPaymentMethods(CheckoutController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildPaymentMethod(
              controller, 0, "cash_on_delivery".tr, Icons.money),
          const SizedBox(height: 10),
          _buildPaymentMethod(
              controller, 1, "payment_cards".tr, Icons.credit_card),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(
      CheckoutController controller, int index, String title, IconData icon) {
    return InkWell(
      onTap: () => controller.choosePaymentMethod(index),
      child: CardPaymentMethodCheckout(
        title: title,
        isActive: controller.paymentMethod == index,
        icon: icon,
      ),
    );
  }

  Widget _buildDeliveryTypes(CheckoutController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _buildDeliveryType(
              controller,
              0,
              "delivery".tr,
              AppImageAssets.deliveryImage,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildDeliveryType(
              controller,
              1,
              "receive".tr,
              AppImageAssets.drivethruImage,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryType(CheckoutController controller, int index,
      String title, String imageName) {
    return InkWell(
      onTap: () => controller.chooseDeliveryType(index),
      child: CardDeliveryTypeCheckout(
        imagename: imageName,
        title: title,
        active: controller.deliveryType == index,
      ),
    );
  }

  Widget _buildShippingAddress(CheckoutController controller) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader("shipping_address".tr),
          if (controller.dataaddress.isEmpty)
            _buildEmptyAddressState(controller)
          else
            _buildAddressList(controller),
        ],
      ),
    );
  }

  Widget _buildEmptyAddressState(CheckoutController controller) {
    return Center(
      child: Column(
        children: [
          Text(
            "no_shipping_address".tr,
            style:
                const TextStyle(color: AppColors.greyTextColor, fontSize: 16),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () => controller.goToAddress(),
            icon: const Icon(Icons.add_location),
            label: Text("add_shipping_address".tr),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressList(CheckoutController controller) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.dataaddress.length,
      itemBuilder: (context, index) {
        final address = controller.dataaddress[index];
        return InkWell(
          onTap: () => controller.chooseShippingAddress(address.addressId!),
          child: CardShppingAddressCheckout(
            title: address.addressName ?? "",
            body: "${address.addressCity}, ${address.addressStreet}",
            isactive: controller.addressid == address.addressId,
          ),
        );
      },
    );
  }

  Widget _buildOrderSummary(CheckoutController controller) {
    return Card(
      margin: const EdgeInsets.all(20),
      color: AppColors.white.withAlpha(200),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "order_summary".tr,
              style:
                  const TextStyle(fontSize: s18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSummaryRow("subtotal".tr, "\$${0.0}"),
            _buildSummaryRow("shipping".tr, "\$${0.0}"),
            _buildSummaryRow("tax".tr, "\$${0.0}"),
            const Divider(),
            _buildSummaryRow("total".tr, "\$${controller.ordersPrice}",
                isBold: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton(CheckoutController controller) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () => controller.checkout(),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          'checkout'.tr,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.white),
        ),
      ),
    );
  }
}
