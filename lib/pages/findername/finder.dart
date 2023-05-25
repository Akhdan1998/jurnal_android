part of '../pages.dart';

class finder extends StatefulWidget {
  @override
  State<finder> createState() => _finderState();
}

class _finderState extends State<finder> {
  final hurufawalan = TextEditingController();
  String selectedKelamin = 'Laki-laki';

  // String selectedKelamin3 = '';
  String dropdownValue = list.first;
  int? show1;
  bool show2 = false;

  @override
  void initState() {
    super.initState();
    context
        .read<TemaCubit>()
        .getTema('Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        // physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 412,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  color: 'D9D9D9'.toColor(),
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  padding: EdgeInsets.only(left: 16, top: 43),
                  child: Row(
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
                        'Pencarian Nama',
                        style: GoogleFonts.poppins().copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: '747474'.toColor(),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  top: 150,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: 'F0F0F0'.toColor(),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    // height: 131,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pencarian Nama',
                                style: GoogleFonts.poppins().copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: '323232'.toColor()),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      'Reset',
                                      style: GoogleFonts.poppins().copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: 'FF6969'.toColor()),
                                    ),
                                    SizedBox(width: 3),
                                    Icon(
                                      Icons.refresh_outlined,
                                      color: 'FF6969'.toColor(),
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        BlocBuilder<TemaCubit, TemaState>(
                            builder: (context, snapshot) {
                          if (snapshot is TemaLoaded) {
                            if (snapshot.temanama != null) {
                              return DropdownButtonFormField<String>(
                                value: dropdownValue,
                                icon: Icon(
                                  Icons.expand_more_outlined,
                                  color: 'B8B8B8'.toColor(),
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 10, top: 5, right: 5),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        width: 1, color: 'FF6969'.toColor()),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: GoogleFonts.poppins().copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        // color: '989797'.toColor(),
                                      ),
                                    ),
                                  );
                                }).toList(),
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
                        }),
                        SizedBox(height: 13),
                        TextField(
                          onChanged: (value) {
                            if (value.length > 1) {
                              setState(() {
                                hurufawalan.text = value[0].capitalize!;
                              });
                            }
                          },
                          controller: hurufawalan,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  width: 1, color: 'FF6969'.toColor()),
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            hintStyle: GoogleFonts.poppins().copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: '989797'.toColor(),
                            ),
                            hintText: 'Ketik Awalan Huruf',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedKelamin = 'Laki-laki';
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: (selectedKelamin == 'Laki-laki')
                                          ? 'FF6969'.toColor()
                                          : 'E2E2E2'.toColor(),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Laki - laki',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      color: '6D6767'.toColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedKelamin = 'Perempuan';
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: (selectedKelamin == 'Perempuan')
                                          ? 'FF6969'.toColor()
                                          : 'E2E2E2'.toColor(),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Perempuan',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      color: '6D6767'.toColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedKelamin = 'Unisex';
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: (selectedKelamin == 'Unisex')
                                          ? 'FF6969'.toColor()
                                          : 'E2E2E2'.toColor(),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Unisex',
                                    style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      color: '6D6767'.toColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            context.read<HurufCubit>().getHuruf(
                                'Bearer 1354|r5uOe7c4yC14CDvrkeTfP73s0AIrkG01EKos4lC4',
                                hurufawalan.text,
                                selectedKelamin,
                                dropdownValue);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 11, bottom: 11),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: 'FF6969'.toColor(),
                              ),
                              color: Colors.white,
                            ),
                            child: Text(
                              'Cari inspirasi nama anak',
                              style: GoogleFonts.poppins().copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: 'FF6969'.toColor(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      border: Border.all(color: 'F0F0F0'.toColor(), width: 1),
                      color: 'FF6969'.toColor(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hasil Pencarian',
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Semua Preferensi - Awalan A - Unisex',
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                      border: Border.all(color: 'F0F0F0'.toColor(), width: 1),
                    ),
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    child: BlocBuilder<HurufCubit, HurufState>(
                        builder: (context, snapshot) {
                      if (snapshot is HurufLoaded) {
                        if (snapshot.abjad != null) {
                          return Column(
                            children: snapshot.abjad!
                                .mapIndexed(
                                  (int index, e) => Container(
                                    color: (index.isEven)
                                        ? Colors.white
                                        : 'FFF9F9'.toColor(),
                                    child: Column(children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(children: [
                                              Text(
                                                '${index + 1}' '.',
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                e.nama ?? '',
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                              ),
                                            ]),
                                            GestureDetector(
                                              onTap: () {
                                                if (show1 == e.id) {
                                                  setState(() {
                                                    show1 = null;
                                                  });
                                                } else {
                                                  setState(() {
                                                    show1 = e.id;
                                                  });
                                                }
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Detail',
                                                    style: GoogleFonts.poppins()
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12,
                                                            color: 'FF6969'
                                                                .toColor()),
                                                  ),
                                                  SizedBox(width: 5),
                                                  (show1 == e.id)
                                                      ? Icon(
                                                          Icons
                                                              .expand_less_outlined,
                                                          color:
                                                              'FF6969'.toColor())
                                                      : Icon(
                                                          Icons
                                                              .expand_more_outlined,
                                                          color:
                                                              'FF6969'.toColor()),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      (show1 == e.id)
                                          ? Text(
                                              e.deskripsi ?? '',
                                              style: GoogleFonts.poppins()
                                                  .copyWith(
                                                      fontSize: 11,
                                                      color:
                                                          '414141'.toColor()),
                                            )
                                          : SizedBox(),
                                    ]),
                                  ),
                                )
                                .toList(),
                          );
                        } else {
                          return SizedBox();
                        }
                      } else {
                        return SizedBox();
                      }
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
