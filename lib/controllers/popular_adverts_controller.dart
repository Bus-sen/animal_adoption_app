import 'package:animal_app/data/repository/popular_adverts_repo.dart';
import 'package:get/get.dart';

class PopularAdvertsController extends GetxController{
  final PopularAdvertsRepo popularAdvertsRepo;
  PopularAdvertsController({required this.popularAdvertsRepo});
  List<dynamic> _popularAdvertsList=[];
  List<dynamic> get popularAdvertsList => _popularAdvertsList;

  Future<void> getPopularAdvertsList()async {
    Response response = await popularAdvertsRepo.getPopularAdvertsList();
    if(response.statusCode==200){
      _popularAdvertsList=[];
      //_popularAdvertsList.addAll();
      update();
    } else {

    }
  }
}