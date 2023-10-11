import 'dart:developer';

import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/models/read_profile_model.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _readProfileInProgress = false;
  String _message = '';
  ProfileData _profileData = ProfileData();
  bool get readProfileInProgress=>_readProfileInProgress;
  String get message => _message;
  ProfileData get profileData => _profileData;

  Future<bool> readProfileData() async {
    _readProfileInProgress=true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.readProfile);
    _readProfileInProgress=false;
    update();
    log(response.isSuccess.toString());
    if (response.isSuccess) {
      //_profileData =ProfileData.fromJson(response.responseJson??{});
      return true;
    } else {
      return false;
    }
  }
}
