part of '../pages.dart';

class ubahdatakelahirananak extends StatefulWidget {
  BuatDataAnak ubahData;

  ubahdatakelahirananak(this.ubahData);

  @override
  State<ubahdatakelahirananak> createState() => _ubahdatakelahirananakState();
}

class _ubahdatakelahirananakState extends State<ubahdatakelahirananak> {
  final bb = TextEditingController();
  final tb = TextEditingController();
  final lk = TextEditingController();
  bool isLoading = false;

  void simpanData(String berat, String tinggi, String lingkar) async {
    Uri url = Uri.parse(
        "https://dashboard.parentoday.com/api/anak/pertumbuhan/update");
    var res = await http.post(
      url,
      body: {
        'id': widget.ubahData.id.toString(),
        "berat_lahir": berat,
        "tinggi_lahir": tinggi,
        "lingkar_kepala_lahir": lingkar,
      },
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
      },
    );
    print(res.body.toString());
    Map<String, dynamic> body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Kamu berhasil memperbaharui data anak!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: 'FF6969'.toColor(),
          textColor: Colors.white,
          fontSize: 16.0
      );
      BuatDataAnak data = BuatDataAnak.fromJson(body["data"]);
      print(res.statusCode);
      Get.off(
        navigation(
          'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
          index: 0,
        ),
      );
    } else {
      throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
    }
  }

  @override
  void initState() {
    super.initState();
    bb.text = widget.ubahData.berat_lahir.toString() ?? '';
    tb.text = widget.ubahData.tinggi_lahir.toString() ?? '';
    lk.text = widget.ubahData.lingkar_kepala_lahir.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
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
                  color: '888888'.toColor(),
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Ubah Data Detail Anak',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: '747474'.toColor(),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          clipBehavior: Clip.hardEdge,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Berat Badan Lahir (gram)',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: '5A5A5A'.toColor(),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: bb,
                keyboardType: TextInputType.number,
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
                  hintText: 'Ex: 2000',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Tinggi Badan Lahir (cm)',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: '5A5A5A'.toColor(),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: tb,
                keyboardType: TextInputType.number,
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
                  hintText: 'Ex : 40',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 15),
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
                keyboardType: TextInputType.number,
                controller: lk,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(width: 1, color: 'FF6969'.toColor()),
                  ),
                  contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  hintStyle: GoogleFonts.poppins().copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: '989797'.toColor(),
                  ),
                  hintText: 'Ex : 35',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: (Platform.isIOS) ? 80 : 60,
        padding: (Platform.isIOS)
            ? EdgeInsets.only(left: 16, right: 16, bottom: 25, top: 10)
            : EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
        child: GestureDetector(
          onTap: () {
            simpanData(bb.text, tb.text, lk.text);
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              color: 'FF6969'.toColor(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: isLoading
                ? Container(
                    width: 20,
                    height: 20,
                    child: Center(
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2),
                    ),
                  )
                : Text(
                    'Simpan Data Anak',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: 'FFFFFF'.toColor(),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
