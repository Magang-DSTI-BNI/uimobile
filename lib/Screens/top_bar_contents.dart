import 'package:flutter/material.dart';
import 'package:mobileapp/Variables/custom_theme.dart';
import 'package:mobileapp/Screens/settings.dart';

class TopBarContents extends StatefulWidget {

  TopBarContents();

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child:
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width/30,),
                    Text(
                      'UI Mobile-Staff',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 3,
                      ),
                    ),
                    SizedBox(width: screenSize.width / 7),
                    InkWell(
                      hoverColor: Colors.transparent,
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Beranda',
                            style: TextStyle(
                                color: _isHovering[0]
                                    ? Theme.of(context).textTheme.bodyText1!.color
                                    : Theme.of(context).textTheme.bodyText1!.color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 15),
                    InkWell(
                      hoverColor: Colors.transparent,
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Market',
                            style: TextStyle(
                                color: _isHovering[1]
                                    ? Theme.of(context).textTheme.bodyText1!.color
                                    : Theme.of(context).textTheme.bodyText1!.color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 15),
                    InkWell(
                      hoverColor: Colors.transparent,
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[2] = true
                              : _isHovering[2] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Akun',
                            style: TextStyle(
                                color: _isHovering[2]
                                    ? Theme.of(context).textTheme.bodyText1!.color
                                    : Theme.of(context).textTheme.bodyText1!.color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[2],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 15),
                    InkWell(
                      hoverColor: Colors.transparent,
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[3] = true
                              : _isHovering[3] = false;
                        });
                      },
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                         builder: (context)=>SettingsScreen(),
                        ));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Pengaturan',
                            style: TextStyle(
                                color: _isHovering[3]
                                    ? Theme.of(context).textTheme.bodyText1!.color
                                    : Theme.of(context).textTheme.bodyText1!.color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[3],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),

          ),

      );
    
  }
}
