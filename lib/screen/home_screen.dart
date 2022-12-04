import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hero_mode_module/model/place_model.dart';
import 'package:hero_mode_module/screen/place_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          "Explore Delhi",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString("assets/json/places.json"),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              List<dynamic> showData = json.decode(snapshot.data.toString());
              List<PlaceModel> places = [];
              for (var element in showData) {
                places.add(PlaceModel.fromJson(element));
              }

              return ListView.builder(
                itemCount: places.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlaceScreen(
                            place: places[index].name ?? "",
                            nearestMetro: places[index].nearestMetro ?? "",
                            entryFeeIndian: places[index].entryFeeIndian ?? "",
                            entryFeeNonIndian:
                                places[index].entryFeeNonIndian ?? "",
                            timings: places[index].timings ?? "",
                            closeOnDays: places[index].closedOnDays ?? "",
                            address: places[index].address ?? "",
                            description: places[index].description ?? "",
                            image: places[index].image ?? "",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment(-1.0, -4.0),
                              end: Alignment(1.0, 4.0),
                              colors: [
                                Colors.white,
                                Colors.white,
                              ]),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 8,
                              offset: const Offset(5, 5),
                            ),
                          ]),
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                          bottom: index == showData.length - 1 ? 30 : 0),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                places[index].name.toString(),
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: const TextStyle(
                                    color: Color.fromRGBO(13, 64, 85, 1),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: Hero(
                                tag: places[index].name!,
                                child: Image.asset(
                                  places[index].image!,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
