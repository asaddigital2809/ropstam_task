import 'package:get/get.dart';
import 'package:ropstam_task/api/api_client.dart';
import 'package:ropstam_task/models/ListModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController{
  List<ListModel> model = [];
  bool isLoading = true;
  @override
  void onInit() {
    getList();
  }

  getList()async{
    await ApiClient().getList().then((value){
      if(value!=null){
        model.addAll(value);
        isLoading = false;
      }

    });
    update();
  }
  clearSession()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    update();
  }
}