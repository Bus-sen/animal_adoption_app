import 'package:get/get.dart';
import '../api/api_client.dart';

class PopularAdvertsRepo extends GetxService{
  final ApiClient apiClient;
  PopularAdvertsRepo({required this.apiClient});

  Future<Response> getPopularAdvertsList() async{
    return await apiClient.getData("end point url"); //değişecek
  }
}