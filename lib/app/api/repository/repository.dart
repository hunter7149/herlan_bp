import '../provider/provider.dart';
import '../service/api_service.dart';
import '../service/prefrences.dart';
import '../url/app_url.dart';

class Repository extends Providers {
  var deviceId = Pref.readData(key: Pref.DEVICE_IDENTITY);

  ///-------------------------User related api-------------------------///
  Future<dynamic> requestLogin({required Map<String, dynamic> map}) async =>
      await commonApiCall(
              endPoint: AppUrl.loginApi, method: Method.POST, map: map)
          .then((value) => value);

  Future<dynamic> requestVerification(
          {required Map<String, dynamic> map}) async =>
      await tokenBaseApi(endPoint: AppUrl.check, method: Method.POST, map: map)
          .then((value) => value);

  Future<dynamic> createCustomer({required Map<String, dynamic> map}) async =>
      await tokenBaseApi(
              endPoint: AppUrl.createCustomer, method: Method.POST, map: map)
          .then((value) => value);
}
