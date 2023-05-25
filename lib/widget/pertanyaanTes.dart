part of '../pages/pages.dart';

class pertanyaanTes extends StatefulWidget {
  late final int milestones_id;
  late final Milestones_todolist? tesList;

  pertanyaanTes(this.milestones_id, this.tesList);

  @override
  State<pertanyaanTes> createState() => _pertanyaanTesState();
}

class _pertanyaanTesState extends State<pertanyaanTes> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    if (widget.tesList!.is_active == true) {
      isChecked = true;
    } else {
      isChecked = false;
    }
  }

  Future<void> pencapaian() async {
    try {
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
          "Authorization":
              "Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4",
        },
      );
      Map<String, dynamic> body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        bool data = body["data"];
      } else {
        throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
    }
  }

  Future<void> reset() async {
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
    } else {
      throw "Error ${res.statusCode} => ${body["meta"]["message"]}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: 40,
              width: 18,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                checkColor: Colors.white,
                activeColor: '86C3BB'.toColor(),
                value: isChecked,
                onChanged: (bool? value) async {
                  if (isChecked == true) {
                    await reset().whenComplete(() async {
                      await context.read<KategoriCubit>().getMilestonesKat(
                          'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4');
                    });
                  } else {
                    await pencapaian().whenComplete(() async {
                      await context.read<KategoriCubit>().getMilestonesKat(
                          'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4');
                    });
                  }

                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Get.to(
                    detailperkembangan(widget.tesList, widget.milestones_id));
              },
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width - 156,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 180,
                          child: Text(
                            widget.tesList!.title ?? '',
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: (Platform.isIOS) ? 11 : 9,
                                fontWeight: FontWeight.bold,
                                color: '323232'.toColor()),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 180,
                          child: Text(
                            widget.tesList!.subtitle ?? '',
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: (Platform.isIOS) ? 10 : 8,
                                fontWeight: FontWeight.w300,
                                color: '7A7A7A'.toColor()),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: 'E2E2E2'.toColor(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
