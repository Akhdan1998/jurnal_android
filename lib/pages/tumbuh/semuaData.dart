part of '../pages.dart';

class semuaData extends StatefulWidget {
  @override
  State<semuaData> createState() => _semuaDataState();
}

class _semuaDataState extends State<semuaData> {
  final tanggal = TextEditingController();
  final berat = TextEditingController();
  final tinggi = TextEditingController();
  final lingkar = TextEditingController();

  void dataPertumbuhan(String anak_id, String tinggi, String berat,
      String lingkar_kepala, String checked_at) async {
    Uri url = Uri.parse(
        "https://dashboard.parentoday.com/api/jurnal/pertumbuhan/create");
    var res = await http.post(
      url,
      body: {
        "anak_id": anak_id,
        "tinggi": tinggi,
        "berat": berat,
        "lingkar_kepala": lingkar_kepala,
        "checked_at": checked_at + ' ' + '07:00:00',
      },
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
      },
    );
    Map<String, dynamic> body = jsonDecode(res.body);
    print('coeg' + res.body.toString());
    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Kamu berhasil memperbaharui data Pertumbuhan anak!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: 'FF6969'.toColor(),
          textColor: Colors.white,
          fontSize: 16.0);
      BuatDataAnak data = BuatDataAnak.fromJson(body["data"]);
      Get.off(
        navigation(
          "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
          index: 1,
        ),
      );
      print(res.statusCode);
    } else {
      throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: 'FF6969'.toColor(),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: 'FFFFFF'.toColor(),
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Buat Data Pertumbuhan',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: 'FFFFFF'.toColor(),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 15),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal Cek',
              style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: '5A5A5A'.toColor(),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: tanggal,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.date_range,
                  size: 20,
                  color: '8F8F8F'.toColor(),
                ),
                hintStyle: GoogleFonts.poppins().copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: '989797'.toColor(),
                ),
                hintText: '24 Maret 2023',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(width: 1, color: 'FF6969'.toColor()),
                ),
                contentPadding: EdgeInsets.only(top: 5, left: 10, bottom: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1945),
                    lastDate: DateTime(2500));

                if (pickeddate != null) {
                  setState(() {
                    tanggal.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                  });
                }
              },
            ),
            SizedBox(height: 20),
            Text(
              'Berat Badan (gram)',
              style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: '5A5A5A'.toColor(),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: berat,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(width: 1, color: 'FF6969'.toColor()),
                ),
                contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                hintStyle: GoogleFonts.poppins().copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: '989797'.toColor(),
                ),
                hintText:
                    'Penulisan menggunakan format gram, 2000 untuk 2000 gram',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tinggi Badan (cm)',
              style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: '5A5A5A'.toColor(),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: tinggi,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(width: 1, color: 'FF6969'.toColor()),
                ),
                contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                hintStyle: GoogleFonts.poppins().copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: '989797'.toColor(),
                ),
                hintText: 'Penulisan menggunakan format cm, 20 untuk 20 cm',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Lingkar Kepala (cm)',
              style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: '5A5A5A'.toColor(),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: lingkar,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(width: 1, color: 'FF6969'.toColor()),
                ),
                contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                hintStyle: GoogleFonts.poppins().copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: '989797'.toColor(),
                ),
                hintText: 'Penulisan menggunakan format cm, 12 untuk 12 cm',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: (Platform.isIOS) ? 80 : 60,
        padding: (Platform.isIOS)
            ? EdgeInsets.only(left: 16, right: 16, bottom: 25, top: 10)
            : EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
        child: BlocBuilder<BuatdataanakCubit, BuatdataanakState>(
          builder: (context, snapshot) {
            if (snapshot is BuatdataanakLoaded) {
              if (snapshot.dataanak != null) {
                return GestureDetector(
                  onTap: () {
                    dataPertumbuhan(snapshot.dataanak!.first.anak_id.toString(),
                        tinggi.text, berat.text, lingkar.text, tanggal.text);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: 'FF6969'.toColor(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Simpan Data',
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: 'FFFFFF'.toColor(),
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: 'FF6969'.toColor(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
