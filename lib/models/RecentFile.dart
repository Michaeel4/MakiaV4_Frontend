class RecentFile {
  String? icon, title, date, avg_speed, video_file;

  RecentFile(
      {this.icon, this.title, this.date, this.avg_speed, this.video_file});

  static fromJson(item) {}
}

// List demoRecentFiles = [
//   RecentFile(
//       icon: "assets/icons/media_file.svg",
//       title: "Car 01",
//       date: "01-03-2021",
//       avg_speed: "27km/h",
//       video_file: "url"),
//   RecentFile(
//       icon: "assets/icons/Figma_file.svg",
//       title: "Figma File",
//       date: "27-02-2029",
//       avg_speed: "27km/h",
//       video_file: "hans"),
//   RecentFile(
//       icon: "assets/icons/Figma_file.svg",
//       title: "Figma File",
//       date: "27-02-2021",
//       avg_speed: "27km/h",
//       video_file: "hans"),
//   // RecentFile(
//   //     icon: "assets/icons/Figma_file.svg",
//   //     title: "Figma File",
//   //     date: "27-02-2021",
//   //     avg_speed: "27km/h",
//   //     video_file: "hans"),

//   // RecentFile(
//   //   icon: "assets/icons/media_file.svg",
//   //   title: "Media File",
//   //   date: "23-02-2021",
//   //   size: "2.5gb",
//   // ),
//   // RecentFile(
//   //   icon: "assets/icons/pdf_file.svg",
//   //   title: "Sales PDF",
//   //   date: "25-02-2021",
//   //   size: "3.5mb",
//   // ),
//   // RecentFile(
//   //   icon: "assets/icons/excle_file.svg",
//   //   title: "Excel File",
//   //   date: "25-02-2021",
//   //   size: "34.5mb",
//   // ),
// ];
