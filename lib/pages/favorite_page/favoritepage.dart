// favorite_page.dart
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pantagonthings/pages/ItemList.dart';
import 'package:pantagonthings/pages/favorite_page/favorite_bloc.dart';
import 'package:pantagonthings/pages/favorite_page/favorite_event.dart';
import 'package:pantagonthings/pages/favorite_page/favorite_state.dart';
import 'package:pantagonthings/repository/airtable_repository.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteBloc(AirtableService(
        baseId: 'appUTL1IglUyPejRu',
        tableName: 'List',
        apiKey:
            'patAISgcZTgxiBMYV.56a388e5a648983751a2681138c78f884284fc54a004033211487631fa2f077c',
      ))
        ..add(FetchFavoriteData()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoading) {
                return Center(
                  child: LoadingAnimationWidget.twoRotatingArc(
                    color: Colors.black,
                    size: 40,
                  ),
                );
              } else if (state is FavoriteLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${state.totalCount}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 32),
                                        ),
                                        const Text(
                                          "Favorite Items",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${state.total}",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 32),
                                        ),
                                        const Text(
                                          "Amount",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 54, 54, 54),
                      ),
                    ),
                    Expanded(
                      child: ItemList(
                        records: state.records,
                        onRefresh: () async {
                          BlocProvider.of<FavoriteBloc>(context)
                              .add(FetchFavoriteData());
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is FavoriteError) {
                return Center(
                  child: Text('Error: ${state.message}'),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FavoritePage(),
  ));
}
