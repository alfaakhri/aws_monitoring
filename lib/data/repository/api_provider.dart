import 'package:aws_monitoring/data/model/data_monitoring_model.dart';
import 'package:aws_monitoring/external/constants.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio _dio = Dio();
  Response _response;

  Future<DataMonitoringModel> getDataMonitoring() async {
    try {
      _response = await _dio
          .get(Constants.API_URL)
          .timeout(Duration(seconds: 30), onTimeout: () {
        // time has run out, do what you wanted to do
        throw Exception("Connection Timeout !");
      });

      if (_response.statusCode < 200 || _response.statusCode > 400) {
          throw new Exception("Error while fetching data");
      }

      final dataMonitoring = DataMonitoringModel.fromJson(_response.data);
        
      return dataMonitoring;
    } catch (e) {
      throw Exception(e.message);
    }
  }
}