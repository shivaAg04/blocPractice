import 'package:learning_bloc/model/list_store_model.dart';

abstract class ListStore {}

class ListStoreState extends ListStore {}

class ListStoreLoaded extends ListStore {
  final List<ListStoreModel> posts;
  ListStoreLoaded(this.posts);
}

class ListErrorState extends ListStore {
  final String error;
  ListErrorState(this.error);
}
