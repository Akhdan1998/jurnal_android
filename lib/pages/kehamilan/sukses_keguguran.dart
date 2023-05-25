part of '../pages.dart';

class keguguran extends StatefulWidget {
  @override
  State<keguguran> createState() => _keguguranState();
}

class _keguguranState extends State<keguguran> {
  void gugur() async {
    Uri url_ = Uri.parse(
        'https://dashboard.parentoday.com/api/jurnal/kehamilan/delete');
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
      Get.offAll(navigation(
        'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
        index: 3,
      ));
      // context
      //     .read<KehamilanCubit>()
      //     .getKehamilan('Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4');
      // Navigator.of(context).pop(); //showmodel
      // Navigator.of(context).pop(); //sheetbutton
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
              'Laporkan Keguguran',
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
              'assets/keguguran.png',
              scale: 2,
            ),
            SizedBox(height: 25),
            Text(
              'Tetap semangat yaa!!',
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
                'Jangan putus asa ya Moms! Akan selalu ada pelangi setelah hujan kok!',
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
                gugur();
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                  color: 'FF6969'.toColor(),
                  borderRadius: BorderRadius.circular(5),
                  // border: Border.all(width: 1, color: 'FF6969'.toColor()),
                ),
                child: Text(
                  'Laporkan Keguguran',
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
                Get.offAll(navigation('Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
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
