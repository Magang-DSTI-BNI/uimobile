import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uimobile_web/Models/category_bar.dart';
import 'package:uimobile_web/Models/BaseAppBar';

class InformasiPribadiScreen extends StatefulWidget {
  const InformasiPribadiScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InformasiPribadiScreen();
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class _InformasiPribadiScreen extends State<InformasiPribadiScreen> {
  final List<String> entries = <String>[
    'Pribadi',
    'Kontak',
    'Alamat',
    'Kontak Darurat',
    'Keluarga dan Tanggungan',
    'Pendidikan',
    'Catatan Pelatihan',
    'Kompetensi',
    'Evaluasi Kinerja',
    'KTP NPWP',
    'Nama Resmi/Ulang Tahun',
    'Bibliografi',
    'Nama Pegawai'
  ];
  // final List<int> colorCodes = <int>[600, 500, 100];

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: BaseAppBar(),
        ),
        body: 
            Container(
                height: 50,
                margin: const EdgeInsets.only(top: 20),
                child: ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      controller: _controller,
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 180,
                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          margin: const EdgeInsets.only(right: 15),
                          child: Center(child: Text(entries[index])),
                        );
                      }),
                )),
           );
  }
}
