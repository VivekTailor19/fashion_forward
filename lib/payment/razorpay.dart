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
      'callback_url': 'https://your-server/callback_url',
      'key': 'rzp_test_JSGLLq4YKyrpg3',
      'amount': '$total',
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