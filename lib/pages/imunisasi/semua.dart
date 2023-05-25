part of '../pages.dart';

class semua extends StatefulWidget {
  List<ImunisasiGroup>? imunisasi;
  semua(this.imunisasi);

  @override
  State<semua> createState() => _semuaState();
}

class _semuaState extends State<semua> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      // clipBehavior: Clip.hardEdge,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: widget.imunisasi!.map((e) => listimunisasi(e)).toList()
      ),
    );
  }
}
