part of '../pages.dart';

class detailperkembangan extends StatefulWidget {
  late final Milestones_todolist? tesList;
  late final int milestones_id;

  detailperkembangan(this.tesList, this.milestones_id);

  @override
  State<detailperkembangan> createState() => _detailperkembanganState();
}

class _detailperkembanganState extends State<detailperkembangan> {
  Future<void> berhasil() async {
    Uri url_ = Uri.parse(
        'https://dashboard.parentoday.com/api/jurnal/milestones/create');
    var res = await http.post(
      url_,
      body: {
        'milestones_id': widget.milestones_id.toString(),
        'kategori_id': widget.tesList!.kategori_id.toString(),
        'todolist_id': widget.tesList!.id.toString(),
      },
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
      },
    );
    Map<String, dynamic> body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      bool data = body["data"];
    } else {
      throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
    }
  }

  void reset() async {
    Uri url_ = Uri.parse(
        'https://dashboard.parentoday.com/api/jurnal/milestones/reset');
    var res = await http.post(
      url_,
      body: {
        'milestones_id': widget.milestones_id.toString(),
        'kategori_id': widget.tesList!.kategori_id.toString(),
        'todolist_id': widget.tesList!.id.toString(),
      },
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
      },
    );
    Map<String, dynamic> body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      bool data = body["data"];
      Get.to(navigation(
        "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
        index: 2,
      ));
    } else {
      throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Riwayat Pencatatan',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/benner.png'),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.tesList!.title ?? '',
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: '323232'.toColor(),
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    widget.tesList!.subtitle ?? '',
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: '7A7A7A'.toColor(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Material :',
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: '323232'.toColor(),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    widget.tesList!.meterial ?? '-',
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: '7A7A7A'.toColor(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Instruksi :',
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: '323232'.toColor(),
                    ),
                  ),
                  SizedBox(height: 3),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: widget.tesList!.instruksi!
                        .split(' -- ')
                        .map(
                          (e) => Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Icon(
                                  Icons.circle,
                                  color: '7A7A7A'.toColor(),
                                  size: 8,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: MediaQuery.of(context).size.width - 45,
                                child: Text(
                                  e,
                                  style: GoogleFonts.poppins().copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: '7A7A7A'.toColor(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: (Platform.isIOS) ? 80 : 60,
        padding: (Platform.isIOS)
            ? EdgeInsets.only(left: 16, right: 16, bottom: 25, top: 10)
            : EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
        child: GestureDetector(
          onTap: () async {
            if (widget.tesList!.is_active == true) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Reset Data Pencapaian',
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    content: Text(
                      'Data pencapaian' +
                          ' ' +
                          '"${widget.tesList!.title.toString()}"' +
                          ' ' +
                          'yakin dihapus?',
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Tidak',
                          style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.bold,
                              color: 'FF6969'.toColor()),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          reset();
                        },
                        child: Text(
                          'Ya',
                          style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.bold,
                              color: 'FF6969'.toColor()),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              await berhasil().whenComplete(() {
                Get.to(navigation(
                    'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
                    index: 2));
              });
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
              color: (widget.tesList!.is_active == false)
                  ? 'FF6969'.toColor()
                  : '86C3BB'.toColor(),
              // color: 'FF6969'.toColor(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              (widget.tesList!.is_active == false)
                  ? 'Pencapaian Berhasil'
                  : 'Reset Pencapaian',
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
