// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:demo/Provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/NewModel/newmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<NewModel> getApi() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2023-05-27&to=2023-05-27&sortBy=popularity&apiKey=ba84fa5992504440a79d088b64be7ee7'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return NewModel.fromJson(data);
    } else {
      return NewModel.fromJson(data);
    }
  }

  List<int> selectItem = [];

  @override
  Widget build(BuildContext context) {
    print("Build");
    // final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(child: Text('News')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: FutureBuilder<NewModel>(
                    future: getApi(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.articles!.length,
                            itemBuilder: (context, index) {
                              return Consumer<FavouriteItemProvider>(
                                builder: (context, value, child) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    height: MediaQuery.of(context).size.height *
                                        0.27,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // outside array
                                          Text(
                                              snapshot.data!.status.toString()),
                                          // array object
                                          Text(snapshot
                                              .data!.articles![index].title
                                              .toString()),
                                          // array sub object
                                          Text(snapshot.data!.articles![index]
                                              .source!.name
                                              .toString()),
                                          IconButton(
                                            onPressed: () {
                                              if (value.selectItem
                                                  .contains(index)) {
                                                value.removeItem(index);
                                              } else {
                                                value.addItem(index);
                                              }

                                              // setState(() {});
                                            },
                                            icon: Icon(value.selectItem
                                                    .contains(index)
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_border_outlined),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                      } else {
                        return const Center(child: Text('loading .....'));
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
