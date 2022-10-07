import 'package:man_shop_app/data/models/payment/add_order_model.dart';
import 'package:man_shop_app/data/models/payment/estimate_order_model.dart';
import 'package:man_shop_app/data/models/payment/promo_code_model.dart';
import 'package:man_shop_app/data/web_service/payment/payment_web_service.dart';

class PaymentRepository {
  PaymentRepository(this.paymentWebService);

  PaymentWebService paymentWebService;

  Future<AddOrderModel> addOrder({
    required int addressId,
    required int paymentMethod,
    required bool usePoints,
  }) async {
    final data = await paymentWebService.addOrder(
      usePoints: usePoints,
      paymentMethod: paymentMethod,
      addressId: addressId,
    );
    return AddOrderModel.fromJson(data);
  }

  Future<EstimateOrderModel> getEstimateData(
      {required bool usePoints, required int promoCodeId}) async {
    final data = await paymentWebService.getEstimateData(
      usePoints: usePoints,
      promoCodeId: promoCodeId,
    );
    return EstimateOrderModel.fromJson(data);
  }

  Future<ValidatePromoCodeModel> validatePromoCode({required String code}) async {
    final data = await paymentWebService.validatePromoCode(code: code);
    return ValidatePromoCodeModel.fromJson(data);
  }
}
