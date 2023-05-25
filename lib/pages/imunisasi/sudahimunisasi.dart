part of '../pages.dart';

class sudahimunisasi extends StatefulWidget {
  List<ImunisasiGroup>? imunisasi;

  sudahimunisasi(this.imunisasi);

  @override
  State<sudahimunisasi> createState() => _sudahimunisasiState();
}

class _sudahimunisasiState extends State<sudahimunisasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: widget.imunisasi!
              .where((e) => e.is_active == true)
              .map((e) => listsudahimunisasi(e))
              .toList(),
        ),
      ),
    );
  }
}
