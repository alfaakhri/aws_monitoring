import 'package:aws_monitoring/data/model/data_monitoring_model.dart';
import 'package:aws_monitoring/data/repository/api_provider.dart';
//Class ini sebagai class abstrak
class Repository {
  final _apiProvider = ApiProvider();

  ///Get Data Monitoring 
  Future<DataMonitoringModel> getDataMonitoring() => _apiProvider.getDataMonitoring();
}