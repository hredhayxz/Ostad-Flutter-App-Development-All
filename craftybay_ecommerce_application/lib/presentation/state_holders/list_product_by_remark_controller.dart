import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/models/new_product_model.dart';
import 'package:craftybay_ecommerce_application/data/models/popular_product_model.dart';
import 'package:craftybay_ecommerce_application/data/models/special_product_model.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class ListProductByRemarkController extends GetxController {
  bool _getProductsInProgress = false;
  PopularProductModel _popularProductModel = PopularProductModel();
  NewProductModel _newProductModel = NewProductModel();
  SpecialProductModel _specialProductModel = SpecialProductModel();
  String _errorMessage = '';

  bool get getProductsInProgress => _getProductsInProgress;

  PopularProductModel get popularProductModel => _popularProductModel;

  NewProductModel get newProductModel => _newProductModel;

  SpecialProductModel get specialProductModel => _specialProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getListProductByRemark(String remark) async {
    _getProductsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getProductsByRemarks(remark));
    _getProductsInProgress = false;
    if (response.isSuccess) {
      if (remark == 'popular') {
        _popularProductModel =
            PopularProductModel.fromJson(response.responseJson ?? {});
      } else {
        if (remark == 'new') {
          _newProductModel =
              NewProductModel.fromJson(response.responseJson ?? {});
        } else {
          _specialProductModel =
              SpecialProductModel.fromJson(response.responseJson ?? {});
        }
      }
      update();
      return true;
    } else {
      if (remark == 'popular') {
        _errorMessage = 'Popular product fetch failed! Try again.';
      } else {
        if (remark == 'new') {
          _errorMessage = 'New product fetch failed! Try again.';
        } else {
          _errorMessage = 'Special product fetch failed! Try again.';
        }
      }
      update();
      return false;
    }
  }
}
