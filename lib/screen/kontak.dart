import 'package:flutter/material.dart';
import 'package:uimobile_web/Models/appbar.dart';
import 'package:uimobile_web/Models/category_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class KontakScreen extends StatefulWidget {
  const KontakScreen({ 
    Key? key, 
    }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _KontakScreen();
  }
}

class _KontakScreen extends State<KontakScreen> {
  String kebangsaanValue = 'Warga Negara A';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppbar(),
          body: SingleChildScrollView(
            child: Column(
            children:  [
              const CategoryBar(),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, right: 250, left: 250),
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(color: HexColor('#DADCE0')),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0, right: 24, bottom: 16, left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Kontak',
                          style: TextStyle(
                            fontSize: 24.75,
                            ),
                          ),

                        const Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 65),
                          child: Text(
                            'Phone 1',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 512,
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 65),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Phone 1',
                              ),
                            ),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 65),
                          child: Text(
                            'Phone 2',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 512,
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 65),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Phone 2',
                              ),
                            ),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 65),
                          child: Text(
                            'Ext',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 270,
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 65),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Ext',
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 65),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 512,
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 65),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Email',
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 65),
                          child: Text(
                            'Email Pribadi',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 512,
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 65),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Email Pribadi',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          )
    );
  }
}