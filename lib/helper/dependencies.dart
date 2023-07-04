import 'package:animal_app/controllers/auth_controller.dart';
import 'package:animal_app/controllers/popular_adverts_controller.dart';
import 'package:animal_app/data/api/api_client.dart';
import 'package:animal_app/data/repository/auth_repo.dart';
import 'package:animal_app/data/repository/popular_adverts_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<void> init() async{
  //api client
  Get.lazyPut(()=> ApiClient(appBaseUrl: "end point url")); //değişecek
  //...... diğerleri
  Get.lazyPut(()=>AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //repos
  Get.lazyPut(()=>PopularAdvertsRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(()=>PopularAdvertsController(popularAdvertsRepo: Get.find()));
  //..... diğerleri de buraya
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}