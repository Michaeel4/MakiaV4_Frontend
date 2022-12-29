import 'package:makia_f/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import '../../../constants.dart';

class RecentFiles extends StatefulWidget {
  @override
  _RecentFilesState createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  bool _showOverlay = false;

  String title = "";
  String speed = "";
  String date = "";
  String url = "";
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
              child: Stack(children: [
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
                    rows: List.generate(demoRecentFiles.length, (index) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Text(demoRecentFiles[index].title),
                            onTap: () {
                              // Add your code to handle the tap event here

                              print("you tapped me!");
                              setState(() {
                                _showOverlay = true;

                                title = demoRecentFiles[index].title;
                                date = demoRecentFiles[index].date;
                                speed = demoRecentFiles[index].avg_speed;
                                url = demoRecentFiles[index].video_file;
                              });
                            },
                          ),
                          DataCell(
                            Text(demoRecentFiles[index].date),
                            onTap: () {
                              print("you tapped me!");
                              setState(() {
                                setState(() {
                                  _showOverlay = true;

                                  title = demoRecentFiles[index].title;
                                  date = demoRecentFiles[index].date;
                                  speed = demoRecentFiles[index].avg_speed;
                                  url = demoRecentFiles[index].video_file;
                                });
                              });
                              // Add your code to handle the tap event here
                            },
                          ),
                          DataCell(
                            Text(demoRecentFiles[index].avg_speed),
                            onTap: () {
                              print("you tapped me!");
                              setState(() {
                                _showOverlay = true;

                                title = demoRecentFiles[index].title;
                                date = demoRecentFiles[index].date;
                                speed = demoRecentFiles[index].avg_speed;
                                url = demoRecentFiles[index].video_file;
                              });
                              // Add your code to handle the tap event here
                            },
                          ),
                          DataCell(
                            Text(demoRecentFiles[index].video_file),
                            onTap: () {
                              print("you tapped me!");
                              setState(() {
                                _showOverlay = true;

                                title = demoRecentFiles[index].title;
                                date = demoRecentFiles[index].date;
                                speed = demoRecentFiles[index].avg_speed;
                                url = demoRecentFiles[index].video_file;
                              });
                            },
                          ),
                        ],
                      );
                    })),
                if (_showOverlay)
                  Positioned.fill(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Overlay"),
                              Text(title),
                              Text(date),
                              IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {
                                  setState(() {
                                    _showOverlay = false;
                                  });
                                },
                              )
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
