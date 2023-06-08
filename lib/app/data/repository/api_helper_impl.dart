import 'package:get/get.dart';
import 'package:quiz_application/app/common/constants.dart';
import 'package:quiz_application/app/common/storage/storage.dart';
import 'package:quiz_application/app/data/interceptor.dart';

import 'api_helper.dart';

class ApiHelperImpl extends GetConnect implements ApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = Constants.timeout;
    addRequestModifier();

    httpClient.addResponseModifier(
      (request, response) => interceptor(
        httpClient,
        request,
        response,
      ),
    );
    if (Storage.hasData(Constants.token)) {
      printInfo(info: Storage.getValue(Constants.token));
    }
  }

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) {
      if (Storage.hasData(Constants.token)) {
        request.headers['Authorization'] = Storage.getValue(Constants.token);
      }

      printInfo(
        info: 'REQUEST ║ ${request.method.toUpperCase()}\n'
            'url: ${request.url}\n'
            'Headers: ${request.headers}\n'
            'Body: ${request.files?.toString() ?? ''}\n',
      );

      return request;
    });
  }

  @override
  Future<Response> getQuizInfo() {
    return get("/api.php?amount=5");
  }
}
