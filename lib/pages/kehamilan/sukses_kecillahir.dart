part of '../pages.dart';

class sukseskecillahir extends StatefulWidget {
  Kelahiran? tekdung;

  sukseskecillahir(this.tekdung);

  @override
  State<sukseskecillahir> createState() => _sukseskecillahirState();
}

class _sukseskecillahirState extends State<sukseskecillahir> {
  void tandai() async {
    Uri url_ = Uri.parse(
        'https://dashboard.parentoday.com/api/jurnal/kehamilan/born');
    var res = await http.post(
      url_,
      body: {
        //
      },
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
      },
    );
    Map<String, dynamic> body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      bool data = body["data"];
      widget.tekdung;
      Get.off(dataanakKehamilan(
        'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4', widget.tekdung
      ));
    } else {
      throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: '888888'.toColor(),
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Tandai Si Kecil Sudah Lahir',
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
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset(
              'assets/successkecillahir.png',
              scale: 2,
            ),
            SizedBox(height: 25),
            Text(
              'Selamat Si Kecil Sudah Lahir',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: '323232'.toColor(),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 80,
              child: Text(
                'Untuk memantau pertumbuhan dan perkembangan bayi, isi jurnal parent ini yuk!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: '989797'.toColor(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: (Platform.isIOS) ? 150 : 125,
        padding: (Platform.isIOS)
            ? EdgeInsets.only(left: 16, right: 16, bottom: 25, top: 10)
            : EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                tandai();
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                  color: 'FF6969'.toColor(),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Tandai & Buat Data Anak',
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: 'FFFFFF'.toColor(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Get.offAll(navigation(
                  'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
                  index: 3,
                ));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: 'FF6969'.toColor()),
                ),
                child: Text(
                  'Batalkan',
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: 'FF6969'.toColor(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
