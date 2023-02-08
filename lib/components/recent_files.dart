import 'dart:convert';
import 'dart:js_util';

import 'package:makia_f/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import '../../../constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class RecentFiles extends StatefulWidget {
  @override
  _RecentFilesState createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  bool _showOverlay = false;
  String? title = "";
  String? speed = "";
  String? date = "";
  String? url = "";

  double _minSpeed = 0;
  double _maxSpeed = 100;

  final databaseReference = FirebaseDatabase.instance.ref();

  List<RecentFile> recentFiles = [];

  Future getData() async {
    // final ref = FirebaseDatabase.instance.ref("/cars");
    // final snapshot = await ref.get();
    // if (snapshot.exists) {
    //   print("parent");
    //   print(snapshot.children.first.key);
    //   print(snapshot.value);
    //   snapshot.children.forEach((element) {
    //     print("children");
    //     print(element.key);
    //     var file = RecentFile(
    //         icon: "assets/icons/media_file.svg",
    //         title: element.key.toString(),
    //         date: element.child("date").value.toString(),
    //         avg_speed: element.child("speed").value.toString() + " km/h",
    //         video_file: element.child("url").value.toString());

    //     recentFiles.add(file);

    //     setState(() {});
    //   });
    var data;
    var file;
    final response = await http
        .get(
          Uri.parse('http://localhost:3003/makia/entries'),
          // headers: <String, String>{
          //   'Content-Type': 'application/json; charset=UTF-8',
          // },
        )
        .then((value) => {
              data = json.decode(value.body),
              print(data.length),
              data.forEach((element) {
                print(element["id"]);
                file = RecentFile(
                    icon: "./assets/icons/media_file.svg",
                    title: element["id"].toString(),
                    date: element["timestamp"].toString(),
                    avg_speed: element["avgVelocity"].toString() + " km/h",
                    video_file: element["category"].toString());
                recentFiles.add(file);
                setState(() {});
              }),
            });
  }

  @override
  void initState() {
    super.initState();
    getData();
    print(recentFiles.length);
    // databaseReference.once().then((DataSnapshot snapshot) {
    //   recentFiles =
    //       List.from(snapshot.value!.map((item) => RecentFile.fromJson(item)));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Files",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            child: Column(
              children: [
                Text("Avg. Speed Filter"),
                Slider(
                  value: _minSpeed,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  onChanged: (value) {
                    setState(() {
                      _minSpeed = value;
                    });
                  },
                ),
                Slider(
                  value: _maxSpeed,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  onChanged: (value) {
                    setState(() {
                      _maxSpeed = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
              height: 500,
              width: double.infinity,
              child: recentFiles.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Stack(children: [
                      DataTable2(
                          minWidth: 600,
                          columnSpacing: defaultPadding,
                          columns: const [
                            DataColumn(
                              label: Text("Car ID"),
                            ),
                            DataColumn(label: Text("Date")),
                            DataColumn(label: Text("Avg. Speed")),
                            DataColumn(label: Text("Vehicle Type")),
                          ],
                          rows: List.generate(recentFiles.length, (index) {
                            print(recentFiles.first.title);
                            print(index);

                            return DataRow(
                              cells: [
                                DataCell(
                                  Text(recentFiles[index].title.toString()),
                                  onTap: () {
                                    // Add your code to handle the tap event here

                                    print("you tapped me!");
                                    setState(() {
                                      _showOverlay = true;

                                      title = recentFiles[index].title;
                                      date = recentFiles[index].date;
                                      speed = recentFiles[index]
                                          .avg_speed
                                          .toString();
                                      url = recentFiles[index].video_file;
                                    });
                                  },
                                ),
                                DataCell(
                                  Text(recentFiles[index].date!),
                                  onTap: () {
                                    print("you tapped me!");
                                    setState(() {
                                      _showOverlay = true;

                                      title = recentFiles[index].title;
                                      date = recentFiles[index].date;
                                      speed = recentFiles[index].avg_speed;
                                      url = recentFiles[index].video_file;
                                    });
                                    // Add your code to handle the tap event here
                                  },
                                ),
                                DataCell(
                                  Text(recentFiles[index].avg_speed!),
                                  onTap: () {
                                    print("you tapped me!");
                                    setState(() {
                                      _showOverlay = true;

                                      title = recentFiles[index].title;
                                      date = recentFiles[index].date;
                                      speed = recentFiles[index].avg_speed;
                                      url = recentFiles[index].video_file;
                                    });
                                    // Add your code to handle the tap event here
                                  },
                                ),
                                DataCell(
                                  Text(recentFiles[index].video_file!),
                                  onTap: () {
                                    print("you tapped me!");
                                    setState(() {
                                      _showOverlay = true;

                                      title = recentFiles[index].title;
                                      date = recentFiles[index].date;
                                      speed = recentFiles[index].avg_speed;
                                      url = recentFiles[index].video_file;
                                    });
                                  },
                                ),
                              ],
                            );
                          })),
                      //   } else {
                      //     return Center(
                      //       child: CircularProgressIndicator(),
                      //     );
                      //   }
                      //   return CircularProgressIndicator();
                      // }),
                      if (_showOverlay)
                        Positioned.fill(
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.black.withOpacity(0.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      child: IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          setState(() {
                                            _showOverlay = false;
                                          });
                                        },
                                      ),
                                      alignment: Alignment.topRight,
                                      margin: const EdgeInsets.only(right: 15),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Car ID: " + this.title!,
                                          textAlign: TextAlign.left,
                                          style: (TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ),
                                        Text("Date: " + this.date!),
                                        Text("Avg. Speed: " + this.speed!),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      width: 400,
                                      height: 400,
                                      color: Colors.white,
                                      child: Text('Video placeholder'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text("Video placeholder"),
                            //   ],
                            // )
                          ),
                        ),
                    ])),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            // SvgPicture.asset(
            //   fileInfo.icon!,
            //   height: 30,
            //   width: 30,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.avg_speed!)),
      DataCell(Text(fileInfo.video_file!)),
    ],
  );
}
