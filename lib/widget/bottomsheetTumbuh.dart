// part of '../pages/pages.dart';
//
// class bottomsheetTumbuh extends StatefulWidget {
//   final String anak_id;
//   final String gender;
//
//   bottomsheetTumbuh(this.anak_id, this.gender);
//
//   @override
//   State<bottomsheetTumbuh> createState() => _bottomsheetTumbuhState();
// }
//
// class _bottomsheetTumbuhState extends State<bottomsheetTumbuh> {
//   final tanggalcek1 = TextEditingController();
//   final tanggalcek = TextEditingController();
//   final tinggi = TextEditingController();
//   Future<void> dataTinggi(
//       String anak_id, String tinggi, String checked_at) async {
//     Uri url = Uri.parse(
//         "https://dashboard.parentoday.com/api/jurnal/pertumbuhan/tinggi/create");
//     var res = await http.post(
//       url,
//       body: {
//         "anak_id": anak_id,
//         "tinggi": tinggi,
//         "checked_at": checked_at + ' ' + '07:00:00',
//       },
//       headers: {
//         "Accept": "application/json",
//         "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
//       },
//     );
//     Map<String, dynamic> body = jsonDecode(res.body);
//     if (res.statusCode == 200) {
//       Fluttertoast.showToast(
//           msg: "Kamu berhasil memperbaharui data Tinggi Badan anak!",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.TOP,
//           timeInSecForIosWeb: 3,
//           backgroundColor: 'FF6969'.toColor(),
//           textColor: Colors.white,
//           fontSize: 16.0);
//       BuatDataAnak data = BuatDataAnak.fromJson(body["data"]);
//       print(res.statusCode);
//     } else {
//       throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//           color: Colors.white,
//         ),
//         // height: MediaQuery.of(context).size.height,
//         padding: EdgeInsets.only(
//             top: 16,
//             right: 16,
//             left: 16,
//             bottom: MediaQuery.of(context).viewInsets.bottom),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Isi Data Tinggi',
//               style: GoogleFonts.poppins().copyWith(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: '323232'.toColor(),
//               ),
//             ),
//             SizedBox(height: 14),
//             Text(
//               'Tanggal Cek',
//               style: GoogleFonts.poppins().copyWith(
//                 fontSize: 11,
//                 color: '5A5A5A'.toColor(),
//               ),
//             ),
//             SizedBox(height: 3),
//             TextField(
//               controller: tanggalcek1,
//               decoration: InputDecoration(
//                 suffixIcon: Icon(
//                   Icons.date_range,
//                   size: 20,
//                   color: '8F8F8F'.toColor(),
//                 ),
//                 hintStyle: GoogleFonts.poppins().copyWith(
//                   fontSize: 10,
//                   fontWeight: FontWeight.w300,
//                   color: '989797'.toColor(),
//                 ),
//                 hintText: '24 Maret 2023',
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(5)),
//                   borderSide:
//                   BorderSide(width: 1, color: 'FF6969'.toColor()),
//                 ),
//                 contentPadding:
//                 EdgeInsets.only(top: 5, left: 10, bottom: 10),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5)),
//               ),
//               onTap: () async {
//                 DateTime? pickeddate = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1945),
//                     lastDate: DateTime(2500));
//
//                 if (pickeddate != null) {
//                   setState(() {
//                     tanggalcek1.text =
//                         DateFormat('yyyy-MM-dd').format(pickeddate);
//                   });
//                 }
//               },
//             ),
//             SizedBox(height: 14),
//             Text(
//               'Tinggi Badan (cm)',
//               style: GoogleFonts.poppins().copyWith(
//                 fontSize: 11,
//                 color: '5A5A5A'.toColor(),
//               ),
//             ),
//             SizedBox(height: 3),
//             TextField(
//               keyboardType: TextInputType.number,
//               controller: tinggi,
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(5)),
//                   borderSide:
//                   BorderSide(width: 1, color: 'FF6969'.toColor()),
//                 ),
//                 contentPadding:
//                 EdgeInsets.only(left: 10, top: 5, bottom: 5),
//                 hintStyle: GoogleFonts.poppins().copyWith(
//                   fontSize: 10,
//                   fontWeight: FontWeight.w300,
//                   color: '989797'.toColor(),
//                 ),
//                 hintText: '10',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//             ),
//             SizedBox(height: 14),
//             BlocBuilder<BuatdataanakCubit, BuatdataanakState>(
//               builder: (context, snapshot) {
//                 if (snapshot is BuatdataanakLoaded) {
//                   if (snapshot.dataanak != null) {
//                     return GestureDetector(
//                       onTap: () async {
//                         await dataTinggi(
//                             snapshot.dataanak!.first.anak_id.toString(),
//                             tinggi.text,
//                             tanggalcek1.text)
//                             .whenComplete(() {
//                           context.read<TumbuhTinggiCubit>().gettumbuhTinggi(
//                               'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
//                               snapshot.dataanak!.first.anak_id.toString());
//                           context.read<HasilTinggiCubit>().gethasilTinggi(
//                               'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
//                               snapshot.dataanak!.first.gender!,
//                               snapshot.dataanak!.first.anak_id!);
//                           Navigator.of(context).pop();
//                         });
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: MediaQuery.of(context).size.width,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: 'FF6969'.toColor(),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Text(
//                           'Simpan Data',
//                           style: GoogleFonts.poppins().copyWith(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: 'FFFFFF'.toColor(),
//                           ),
//                         ),
//                       ),
//                     );
//                   } else {
//                     return SizedBox();
//                   }
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(
//                       color: 'FF6969'.toColor(),
//                     ),
//                   );
//                 }
//               },
//             ),
//             SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }
// }
