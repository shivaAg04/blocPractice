import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_bloc/model/list_store_model.dart';
import 'package:learning_bloc/model/store_detail_model.dart';

class StoreDetailScreen extends StatefulWidget {
  int? indexx;
  StoreDetailScreen({this.indexx});

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  Future<DetailStoreModel> fetchDetail() async {
    int i = widget.indexx!;
    i = i + 1;
    var response = await Dio()
        .get('https://singhneelesh.github.io/assignment/storeDetails/$i.json');
    var data = response.data;
    return DetailStoreModel.fromJson(data['store$i']);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
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
              child: Text('Error: Something went wrong'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(38.0),
              child: Column(children: [
                Card(
                    child: ListTile(
                  title: Text(snapshot.data.name!.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    snapshot.data.location!.toString(),
                  ),
                )),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.groceryItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        16.0), // Adjust the radius as needed
                                    child: Image.network(
                                      height: _height * 0.1,
                                      width: _width * 0.2,
                                      snapshot.data.groceryItems[index].image
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data.name.toString())
                                    ],
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  MaterialButton(
                                      minWidth: _width * .3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      color: Colors.red,
                                      onPressed: () {},
                                      child: Text(
                                        snapshot.data.groceryItems[index]
                                            .discountPercentage
                                            .toString(),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  MaterialButton(
                                      minWidth: _width * .3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      color: Colors.blue,
                                      onPressed: () {},
                                      child: Text(
                                        snapshot.data.groceryItems[index].price
                                            .toString(),
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]),
            );
          }
        },
      ),
    );
  }
}
