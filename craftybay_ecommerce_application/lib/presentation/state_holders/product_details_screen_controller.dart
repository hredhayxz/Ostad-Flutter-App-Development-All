import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/models/product_details_model.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductDetailsScreenController extends GetxController {
  bool _getProductDetailsInProgress = false;
  ProductDetailsData _productDetailsData = ProductDetailsData();
  String _errorMessage = '';
  final List<String> _availableColors = [];

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  ProductDetailsData get productDetailsData => _productDetailsData;

  List<String> get availableColors => _availableColors;

  String get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int id) async {
    _getProductDetailsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getProductDetails(id));
    _getProductDetailsInProgress = false;
    if (response.isSuccess) {
      _productDetailsData =
          (ProductDetailsModel.fromJson(response.responseJson ?? {}))
              .data!
              .first;
      _convertStringToColor(_productDetailsData.color ?? '');
      update();
      return true;
    } else {
      _errorMessage = 'Fetch product details has been failed! Try again.';
      update();
      return false;
    }
  }

  void _convertStringToColor(String color) {
    final List<String> splittedColors = color.split(',');
    for (String c in splittedColors) {
      if (c.isNotEmpty) {
        _availableColors.add(c);
      }
    }
  }
}
