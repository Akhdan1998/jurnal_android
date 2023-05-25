part of '../pages.dart';

class successimunisasi extends StatefulWidget {
  String imunisasi_id;
  String token;

  successimunisasi(this.imunisasi_id, this.token);

  @override
  State<successimunisasi> createState() => _successimunisasiState();
}

class _successimunisasiState extends State<successimunisasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Asyiik Sudah Imunisasi',
          style: GoogleFonts.poppins().copyWith(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: '747474'.toColor(),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset(
              'assets/successimunitas.png',
              scale: 2,
            ),
            SizedBox(height: 25),
            Text(
              'Selamat Si Kecil Sudah Imunisasi',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: '323232'.toColor(),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              child: Text(
                'Riwayat Imunisasi si kecil telah tersimpan di Jurnal Parent! Jangan lupa di cek secara berkala ya Moms.',
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
        height: (Platform.isIOS) ? 80 : 60,
        padding: (Platform.isIOS)
            ? EdgeInsets.only(left: 16, right: 16, bottom: 25, top: 10)
            : EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
        child: GestureDetector(
          onTap: () {
            Get.offAll(navigation(
                'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4', index: 4,));
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
              'Kembali Ke Jurnal Parent',
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
