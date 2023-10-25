import 'package:dio/dio.dart';
import 'package:learning_bloc/api/api.dart';
import 'package:learning_bloc/model/list_store_model.dart';

class ListStoreRepo {
  API api = API();

  Future<List<ListStoreModel>> fetchListStore() async {
    try {
      Response response = await api.sendRequest.get("/storeList.json");
      var data = response.data;
      List<ListStoreModel> listStoreModel = [];
      for (var i in data['stores']) {
        listStoreModel.add(ListStoreModel.fromJson(i));
      }
      return listStoreModel;
    } catch (ex) {
      throw ex;
    }
  }
}
