import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_bloc/model/list_store_model.dart';
import 'package:learning_bloc/model/store_detail_model.dart';

class StoreDetailScreen extends StatefulWidget {
  int? index;
  StoreDetailScreen({this.index});

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  Future<DetailStoreModel> fetchDetail() async {
    int i = widget.index!;
    i++;
    var response = await Dio()
        .get('https://singhneelesh.github.io/assignment/storeDetails/$i.json');
    var data = response.data;
    return DetailStoreModel.fromJson(data['store$i']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DetailStoreModel>(
        future: fetchDetail(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(child: Text(snapshot.data!.location));

            //         return Padding(
            //           padding: const EdgeInsets.all(18.0),
            //           child: ListView.builder(
            //             itemCount: bookings!.length,
            //             itemBuilder: (context, index) {
            //               return Text(snapshot.data)
            //             },
            // )
            //         );
          }
        },
      ),
    );
  }
}
