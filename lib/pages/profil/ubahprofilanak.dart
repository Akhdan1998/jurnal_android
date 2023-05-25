part of '../pages.dart';

class ubahdataanak extends StatefulWidget {
  BuatDataAnak ubahData;

  ubahdataanak(this.ubahData);

  @override
  State<ubahdataanak> createState() => _ubahdataanakState();
}

class _ubahdataanakState extends State<ubahdataanak> {
  final namaAnak = TextEditingController();
  final tanggalLahir = TextEditingController();
  String selectedKelamin3 = '';
  bool isLoading = false;

  void updateData(String namaAnak, String tanggalLahir) async {
    try {
      Uri url = Uri.parse('https://dashboard.parentoday.com/api/anak/update');

      String gender = (selectedKelamin3 == '1') ? "Laki-laki" : "Perempuan";

      var response = await http.post(
        url,
        body: {
          'name': namaAnak,
          'gender': (selectedKelamin3 == '1') ? 'Laki-laki' : 'Perempuan',
          'birthday': tanggalLahir,
        },
        headers: {
          "Accept": "application/json",
          "Authorization":
              "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
        },
      );
      print(response.body.toString());
      Map<String, dynamic> body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Kamu berhasil memperbaharui data anak!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
            backgroundColor: 'FF6969'.toColor(),
            textColor: Colors.white,
            fontSize: 16.0);
        BuatDataAnak data = BuatDataAnak.fromJson(body['data']);
        print(response.body.toString());
        Get.offAll(
          navigation(
            "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
            index: 0,
          ),
        );
      } else {
        throw 'Error ${response.statusCode} => ${body['meta']['message']}';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
    }
  }

  @override
  void initState() {
    super.initState();
    namaAnak.text = widget.ubahData.name ?? "";
    selectedKelamin3 = (widget.ubahData.gender == 'Laki-laki') ? '1' : '2';
    tanggalLahir.text = widget.ubahData.birthday!.substring(0, 10) ?? '';
  }

  File? _image;

  Future getImage() async {
    final Image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (Image == null) return;
    final imageTemporary = File(Image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              'Ubah Data Anak',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: '747474'.toColor(),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        // physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 40),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: _image != null
                      ? Container(
                          padding: EdgeInsets.all(10),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover, image: FileImage(_image!)),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        )
                      : (widget.ubahData.photo_url ==
                              "https://dashboard.parentoday.com/storage/")
                          ? Image.asset('assets/foto.png')
                          : Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        widget.ubahData.photo_url ?? '')),
                              ),
                            ),
                ),
                Positioned(
                  top: 85,
                  left: 85,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: 'FF6969'.toColor(),
                    ),
                    // padding: EdgeInsets.only(top: 55, left: 65),
                    child: Icon(Icons.edit, color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Anak',
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: '5A5A5A'.toColor(),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: namaAnak,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide:
                            BorderSide(width: 1, color: 'FF6969'.toColor()),
                      ),
                      contentPadding:
                          EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      hintStyle: GoogleFonts.poppins().copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: '989797'.toColor(),
                      ),
                      hintText: 'Nama panggilan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tanggal Lahir',
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: '5A5A5A'.toColor(),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: tanggalLahir,
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
                      hintText: '24 Maret 1998',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide:
                            BorderSide(width: 1, color: 'FF6969'.toColor()),
                      ),
                      contentPadding:
                          EdgeInsets.only(top: 5, left: 10, bottom: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1945),
                          lastDate: DateTime(2500));

                      if (pickeddate != null) {
                        setState(() {
                          tanggalLahir.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jenis Kelamin',
                          style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: '5A5A5A'.toColor(),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedKelamin3 = '1';
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        width: 1,
                                        color: (selectedKelamin3 == '1')
                                            ? 'FF6969'.toColor()
                                            : 'E2E2E2'.toColor(),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(3),
                                    child: Image.asset('assets/laki.png',
                                        scale: 1),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Laki - laki',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      color: '5A5A5A'.toColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedKelamin3 = '2';
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        width: 1,
                                        color: (selectedKelamin3 == '2')
                                            ? 'FF6969'.toColor()
                                            : 'E2E2E2'.toColor(),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(3),
                                    child:
                                        Image.asset('assets/cwe.png', scale: 1),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Perempuan',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      color: '5A5A5A'.toColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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
            updateData(namaAnak.text, tanggalLahir.text);
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
