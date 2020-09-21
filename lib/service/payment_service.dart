import 'package:stripe_payment/stripe_payment.dart';

class StripeTransactionResponse {
  String message;
  bool success;
  StripeTransactionResponse({this.message, this.success});
}

class StripeService {
  static String apiBase = 'https://api.stripe.com//v1';
  static String secret = '';

  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51HPUr6EAAWShrUDbuZKVPQIMxzorgnYUQrdRFVJX6d7IiKMHk6L6LFjvZr4dNz5aMEraOYCgxOYjgA86CTOn9AbR00tQO0CiuT",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  static StripeTransactionResponse payViaExisitingCard(
      {String amount, String currency, card}) {
    return new StripeTransactionResponse(
      message: 'Transaction Successful',
      success: true,
    );
  }

  static Future<StripeTransactionResponse> payViaNewCard(
      {String amount, String currency}) async {
    try {
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());
      print(paymentMethod);
      return new StripeTransactionResponse(
        message: 'Transaction Successful',
        success: true,
      );
    } catch (err) {
      return new StripeTransactionResponse(
        message: 'Transaction Failed: ${err.toString()}',
        success: true,
      );
    }
  }
}
