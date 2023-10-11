import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/models/product_model.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class WishListScreenController extends GetxController {
  bool _getWishListProductsInProgress = false;
  ProductModel _wishListProductModel = ProductModel();
  String _errorMessage = '';

  bool get getWishListProductsInProgress => _getWishListProductsInProgress;

  ProductModel get wishListProductModel => _wishListProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getWishlistProducts() async {
    _getWishListProductsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.productWishList);
    _getWishListProductsInProgress = false;
    if (response.isSuccess) {
      _wishListProductModel =
          ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'WishList product fetch failed! Try again.';
      update();
      return false;
    }
  }
}
