import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/api/list_store_repo.dart';
import 'package:learning_bloc/cubit/list_store_cubit/list_store_state.dart';
import 'package:learning_bloc/model/list_store_model.dart';

class ListStoreCubit extends Cubit<ListStore> {
  ListStoreCubit() : super(ListStoreState()) {
    fetchPosts();
  }

  ListStoreRepo listStoreRepo = ListStoreRepo();

  void fetchPosts() async {
    try {
      List<ListStoreModel> posts = await listStoreRepo.fetchListStore();
      emit(ListStoreLoaded(posts));
    } catch (ex) {
      emit(ListErrorState(ex.toString()));
    }
  }
}
