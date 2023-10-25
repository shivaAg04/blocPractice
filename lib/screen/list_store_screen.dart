import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/cubit/list_store_cubit/list_store_cubit.dart';
import 'package:learning_bloc/cubit/list_store_cubit/list_store_state.dart';
import 'package:learning_bloc/model/list_store_model.dart';

class ListStoreScreen extends StatefulWidget {
  const ListStoreScreen({super.key});

  @override
  State<ListStoreScreen> createState() => _ListStoreScreenState();
}

class _ListStoreScreenState extends State<ListStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("API Handling"),
      ),
      body: SafeArea(
        child: BlocConsumer<ListStoreCubit, ListStore>(
          listener: (context, state) {
            if (state is ListErrorState) {
              SnackBar snackBar = SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is ListStoreState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ListStoreLoaded) {
              return buildPostListView(state.posts);
            }

            return Center(
              child: Text("An error occured!"),
            );
          },
        ),
      ),
    );
  }

  Widget buildPostListView(List<ListStoreModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        var post = posts[0];

        return ListTile(
          title: Text(post.name.toString()),
        );
      },
    );
  }
}
