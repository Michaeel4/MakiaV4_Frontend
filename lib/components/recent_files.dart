import 'dart:js_util';

import 'package:makia_f/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import '../../../constants.dart';
import 'package:firebase_database/firebase_database.dart';

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

  final databaseReference = FirebaseDatabase.instance.ref();

  List<RecentFile> recentFiles = [];

  Future getData() async {
    final ref = FirebaseDatabase.instance.ref("/cars");
    final snapshot = await ref.get();
    if (snapshot.exists) {
      print(snapshot.value);
      snapshot.children.forEach((element) {
        print(element.value);
        var file = RecentFile(
            icon: "assets/icons/media_file.svg",
            title: "Car 01",
            date: "01-03-2021",
            avg_speed: element.child("avg_speed").value.toString(),
            video_file: "url");

        recentFiles.add(file);

        setState(() {});
      });

      print("recentfiles length");

      print(recentFiles.length);

      print("done loading data");

      // print(snapshot.value);
      // print(snapshot.children.length);
      // print(snapshot.children.first.child("url").value);
    } else {
      print('No data available.');
    }
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
          SizedBox(
              height: 500,
              width: double.infinity,
              child: recentFiles.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Stack(children: [
                      // FutureBuilder(
                      //     future: getData(),
                      //     builder: (context, snapshot) {
                      //       print(snapshot.connectionState);
                      //       if (snapshot.connectionState == ConnectionState.done) {
                      DataTable2(
                          minWidth: 600,
                          columnSpacing: defaultPadding,
                          columns: const [
                            DataColumn(
                              label: Text("Car ID"),
                            ),
                            DataColumn(label: Text("Date")),
                            DataColumn(label: Text("Avg. Speed")),
                            DataColumn(label: Text("Video File")),
                          ],
                          rows: List.generate(recentFiles.length, (index) {
                            print(recentFiles.first.title);
                            print(index);
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text("hans"),
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
                                      setState(() {
                                        _showOverlay = true;

                                        title = recentFiles[index].title;
                                        date = recentFiles[index].date;
                                        speed = recentFiles[index].avg_speed;
                                        url = recentFiles[index].video_file;
                                      });
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.menu),
                                      onPressed: () {
                                        setState(() {
                                          _showOverlay = false;
                                        });
                                      },
                                    ),

                                    // Text("Overlay"),
                                    // // Text(title),
                                    // // Text(date),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Video placeholder"),
                                  ],
                                )
                              ],
                            ),
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
