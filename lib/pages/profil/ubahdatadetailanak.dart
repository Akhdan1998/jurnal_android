part of '../pages.dart';

List<String> list2 = <String>['A', 'B', 'AB', 'O'];
List<String> list3 = <String>[
  'Merah',
  'Kuning',
  'Hijau',
  'Biru',
  'Jingga',
  'Abu-Abu',
  'Hitam',
  'Pink',
  'Ungu',
];

class ubahdatadetailanak extends StatefulWidget {
  BuatDataAnak ubahData;

  ubahdatadetailanak(this.ubahData);

  @override
  State<ubahdatadetailanak> createState() => _ubahdatadetailanakState();
}

class _ubahdatadetailanakState extends State<ubahdatadetailanak> {
  final hobi = TextEditingController();
  final citacita = TextEditingController();
  String? dropdownValue2 = list2.first;
  String? dropdownValue3 = list3.first;
  List<Kesukaan> kesukaan = [
    Kesukaan(
      id: '1',
      nama: 'Merah',
      warna: 'FF0000',
    ),
    Kesukaan(
      id: '2',
      nama: 'Kuning',
      warna: 'FFF500',
    ),
    Kesukaan(
      id: '3',
      nama: 'Hijau',
      warna: '0EB100',
    ),
    Kesukaan(
      id: '4',
      nama: 'Biru',
      warna: '1900B1',
    ),
    Kesukaan(
      id: '5',
      nama: 'Jingga',
      warna: 'FF9B05',
    ),
    Kesukaan(
      id: '6',
      nama: 'Abu-Abu',
      warna: '949494',
    ),
    Kesukaan(
      id: '7',
      nama: 'Hitam',
      warna: '000000',
    ),
    Kesukaan(
      id: '8',
      nama: 'Pink',
      warna: 'FF00B8',
    ),
    Kesukaan(
      id: '9',
      nama: 'Ungu',
      warna: 'A60077',
    ),
  ];
  bool isLoading = false;

  void dataSimpan(
      String darah, String hobi, String citacita, String warna) async {
    Uri url =
        Uri.parse("https://dashboard.parentoday.com/api/anak/lengkap/update");
    var res = await http.post(
      url,
      body: {
        'id': widget.ubahData.id.toString(),
        "hobi": hobi,
        "darah": dropdownValue2,
        "cita_cita": citacita,
        "warna": dropdownValue3,
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
          fontSize: 16.0);
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
    dropdownValue2 = widget.ubahData.darah ?? null;
    hobi.text = widget.ubahData.hobi ?? '';
    citacita.text = widget.ubahData.cita_cita ?? '';
    dropdownValue3 = widget.ubahData.warna ?? null;
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
              'Lengkapi Data Anak',
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
                'Profil Detail Anak',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: '323232'.toColor(),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Halo Moms, sebelum mulai isi Jurnal Parent ini lengkapi dulu detail profil si kecil yuk!',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                  color: '7A7A7A'.toColor(),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Golongan Darah',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: '5A5A5A'.toColor(),
                ),
              ),
              SizedBox(height: 5),
              DropdownButtonFormField<String>(
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: '989797'.toColor(),
                ),
                hint: Text('A'),
                value: dropdownValue2,
                icon: Icon(
                  Icons.expand_more_outlined,
                  color: 'B8B8B8'.toColor(),
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15, top: 5, right: 5),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(width: 1, color: 'FF6969'.toColor()),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue2 = value!;
                  });
                },
                items: list2.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 15),
              Text(
                'Hobi Anak',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: '5A5A5A'.toColor(),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: hobi,
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
                  hintText: 'Olahraga, Membaca, dll',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Cita-cita Anak',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: '5A5A5A'.toColor(),
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: citacita,
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
                  hintText: 'Programmer, Bisnismen, dll',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Warna Kesukaan',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  color: '5A5A5A'.toColor(),
                ),
              ),
              SizedBox(height: 5),
              DropdownButtonFormField<String>(
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: '989797'.toColor(),
                ),
                hint: Text('Warna'),
                value: dropdownValue3,
                icon: Icon(
                  Icons.expand_more_outlined,
                  color: 'B8B8B8'.toColor(),
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15, top: 5, right: 5),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(width: 1, color: 'FF6969'.toColor()),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue3 = value!;
                  });
                },
                items: list3.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: 'B8B8B8'.toColor()),
                            color: kesukaan
                                .firstWhere((e) => e.nama == value)
                                .warna!
                                .toColor(),
                            // border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          value,
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
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
            dataSimpan(
                dropdownValue2!, hobi.text, citacita.text, dropdownValue3!);
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
