part of '../pages/pages.dart';

class bottomsheetImunisasi extends StatefulWidget {
  final List<BuatDataAnak> listAnak;

  bottomsheetImunisasi(this.listAnak);

  @override
  State<bottomsheetImunisasi> createState() => _bottomsheetImunisasiState();
}

class _bottomsheetImunisasiState extends State<bottomsheetImunisasi> {
  BuatDataAnak? selectedAnak;
  bool isLoading = false;

  void pilihAnak() async {
    Uri url = Uri.parse("https://dashboard.parentoday.com/api/anak/active");
    var res = await http.post(
      url,
      body: {
        'id': selectedAnak!.id.toString(),
      },
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
      },
    );
    print(res.body.toString());
    Map<String, dynamic> body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      bool data = body["data"];
      print(res.statusCode);
      context.read<BuatdataanakCubit>().getBuatDataAnak(
          'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4');
      Navigator.pop(context);
    } else {
      throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
    }
  }

  @override
  void initState() {
    super.initState();
    selectedAnak = widget.listAnak.firstWhere((e) => e.is_active == 1);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.hardEdge,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        ),
        padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pilih Profil Anak :',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: '323232'.toColor(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(dataanak());
                    },
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Buat Data Anak',
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: 'FF6969'.toColor(),
                            ),
                          ),
                          SizedBox(width: 3),
                          Icon(
                            Icons.add_outlined,
                            color: 'FF6969'.toColor(),
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Column(
                    children: widget.listAnak
                        .map((e) =>
                        listAnak(e, (selectedAnak == e) ? true : false,
                            onChanged: (value) {
                              setState(() {
                                selectedAnak = value;
                              });
                            }))
                        .toList(),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      pilihAnak();
                      setState(() {
                        isLoading = true;
                      });
                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      // width: MediaQuery.of(context).size.width,
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
                        'Pilih Profil',
                        style: GoogleFonts.poppins().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: 'FFFFFF'.toColor(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
