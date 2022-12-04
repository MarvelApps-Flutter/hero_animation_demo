import 'package:flutter/material.dart';

class PlaceScreen extends StatefulWidget {
  final String place;
  final String nearestMetro;
  final String entryFeeIndian;
  final String entryFeeNonIndian;
  final String timings;
  final String closeOnDays;
  final String address;
  final String description;
  final String image;
  const PlaceScreen(
      {super.key,
      required this.place,
      required this.nearestMetro,
      required this.entryFeeIndian,
      required this.entryFeeNonIndian,
      required this.timings,
      required this.closeOnDays,
      required this.address,
      required this.description,
      required this.image});

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.place,
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.amber.shade200,
                  ]),
              //color: Colors.white,
              //    borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                  color:
                      const Color.fromRGBO(204, 205, 206, 1).withOpacity(0.5),
                )
              ]),
          //height: MediaQuery.of(context).size.height*2,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),

          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Hero(
                        tag: widget.place, child: Image.asset(widget.image))),
              ),
              // PLACE NAME CONTAINER
              Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                child: Center(
                  child: Text(
                    widget.place,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Container(
                  decoration: const BoxDecoration(
                      //color: Color.fromRGBO(13,64,85,1).withOpacity(0.2),
                      // borderRadius: BorderRadius.all(Radius.circular(30)),
                      // boxShadow: [
                      //                       BoxShadow(
                      //                         spreadRadius: 3.0,
                      //                   blurRadius: 5.0,
                      //                   color: Color.fromRGBO(204, 205, 206, 1)
                      //                       .withOpacity(0.5),
                      //                       )
                      //                     ]
                      ),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      Column(children: [
                        Text("Timings: ",
                            style: TextStyle(
                                color: Colors.red.shade800,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(
                          widget.timings,
                          style: const TextStyle(
                              color: Color.fromRGBO(13, 64, 85, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        )
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text(
                          "Entry Fee for Indians: ",
                          style: TextStyle(
                              color: Colors.red.shade800,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          widget.entryFeeIndian,
                          style: const TextStyle(
                              color: Color.fromRGBO(13, 64, 85, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text(
                          "Entry Fee for Non Indians: ",
                          style: TextStyle(
                              color: Colors.red.shade800,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          widget.entryFeeNonIndian,
                          style: const TextStyle(
                              color: Color.fromRGBO(13, 64, 85, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        )
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Text(
                          "Closed on day(s): ",
                          style: TextStyle(
                              color: Colors.red.shade800,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          widget.closeOnDays,
                          style: const TextStyle(
                              color: Color.fromRGBO(13, 64, 85, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        )
                      ]),
                      const SizedBox(height: 10),
                      Column(children: [
                        Text(
                          "Address: ",
                          style: TextStyle(
                              color: Colors.red.shade800,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          widget.address,
                          style: const TextStyle(
                              color: Color.fromRGBO(13, 64, 85, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        )
                      ]),
                      const SizedBox(height: 10),
                      Column(children: [
                        Text(
                          "Nearest Metro Station: ",
                          style: TextStyle(
                              color: Colors.red.shade800,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            widget.nearestMetro,
                            style: const TextStyle(
                                color: Color.fromRGBO(13, 64, 85, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ]),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                                color: Colors.red.shade800,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.justify,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              widget.description,
                              style: const TextStyle(
                                  color: Color.fromRGBO(13, 64, 85, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
