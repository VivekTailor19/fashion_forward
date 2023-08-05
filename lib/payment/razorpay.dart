import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentHelper {
  PaymentHelper._();

  static final payment = PaymentHelper._();

  void setPayment(double total) {
    final razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    var options = {
      'key': 'rzp_test_NWrPvHDo1poFSD',
      'amount': "$total", //in the smallest currency sub-unit.
      'name': 'Billionore.ltd',
      'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      'description': 'Buy a Branded Product',
      'timeout': 60, // in seconds
      'prefill': {
        'contact': '1245789865',
        'email': 'tailorvivek012@gmail.com'
      }
    };

    razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment success
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
}