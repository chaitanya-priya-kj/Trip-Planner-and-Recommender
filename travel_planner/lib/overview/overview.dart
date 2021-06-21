import 'package:flutter/material.dart';
import 'package:travel_planner/planning/planning.dart';
import 'places.dart';
// import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:circle_button/circle_button.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Days {
  Days(
    int i, {
    required this.Day,
    // this.tap,
  });
  String Day;
  // bool tap;
}

List<Days> generateDays() {
  int numberOfItems = 4;
  return List<Days>.generate(numberOfItems, (int index) {
    return Days(
      index = index + 1,
      Day: "Day $index",
      // tap: false,
    );
  });
}

class OverviewDetails extends StatefulWidget {
  late final String name;
  OverviewDetails(String str) {
    this.name = str;
  }
  @override
  _Details createState() => _Details();
}

class _Details extends State<OverviewDetails> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  String key = "";
  @override
  void initState() {
    super.initState();
    key = widget.name;
    _fabHeight = _initFabHeight;
  }

  final List<Days> days = generateDays();
  bool _hasBeenPressedm = false;
  bool _hasBeenPresseda = false;
  bool _hasBeenPressede = false;
  bool _hasBeenPressedn = false;
  bool _day1 = false;
  bool _day2 = false;
  bool _day3 = false;
  bool _day4 = false;
  Map<String, String> Morning = {};
  Map<String, String> Afternoon = {};
  Map<String, String> Evening = {};
  Map<String, String> Night = {};

  void append() {
    if (_hasBeenPressedm && _day1) {
      Morning["Day 1"] = places[0]["name"];
    }
    if (_hasBeenPressedm && _day2) {
      Morning["Day 2"] = places[0]["name"];
    }
    if (_hasBeenPressedm && _day3) {
      Morning["Day 3"] = places[0]["name"];
    }
    if (_hasBeenPressedm && _day4) {
      Morning["Day 4"] = places[0]["name"];
    }
    if (_hasBeenPresseda && _day1) {
      Afternoon["Day 1"] = places[0]["name"];
    }
    if (_hasBeenPresseda && _day2) {
      Afternoon["Day 2"] = places[0]["name"];
    }
    if (_hasBeenPresseda && _day3) {
      Afternoon["Day 3"] = places[0]["name"];
    }
    if (_hasBeenPresseda && _day4) {
      Afternoon["Day 4"] = places[0]["name"];
    }
    if (_hasBeenPressede && _day1) {
      Evening["Day 1"] = places[0]["name"];
    }
    if (_hasBeenPressede && _day2) {
      Evening["Day 2"] = places[0]["name"];
    }
    if (_hasBeenPressede && _day3) {
      Evening["Day 3"] = places[0]["name"];
    }
    if (_hasBeenPressede && _day4) {
      Evening["Day 4"] = places[0]["name"];
    }
    if (_hasBeenPressedn && _day1) {
      Night["Day 1"] = places[0]["name"];
    }
    if (_hasBeenPressedn && _day2) {
      Night["Day 2"] = places[0]["name"];
    }
    if (_hasBeenPressedn && _day3) {
      Night["Day 3"] = places[0]["name"];
    }
    if (_hasBeenPressedn && _day4) {
      Night["Day 4"] = places[0]["name"];
    }
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .50;
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        SlidingUpPanel(
          maxHeight: _panelHeightOpen,
          minHeight: _panelHeightClosed,
          // backdropEnabled: true,
          backdropColor: Colors.white,
          parallaxEnabled: true,
          parallaxOffset: .4,
          body: _body(),
          panelBuilder: (sc) => _panel(sc),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
          onPanelSlide: (double pos) => setState(() {
            _fabHeight =
                pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
          }),
        ),
      ],
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Add to Itinerary",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    // fontWeight: FontWeight.normal,

                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleButton(
                      // ignore: sdk_version_set_literal
                      onTap: () => {
                        setState(
                          () {
                            _day1 = !_day1;
                          },
                        ),
                      },
                      width: 75.0,
                      height: 75.0,
                      borderColor: Colors.black,
                      borderWidth: 2.5,
                      borderStyle: BorderStyle.solid,
                      backgroundColor: _day1 ? Colors.black : Colors.white,
                      // backgroundColor: Colors.white,
                      child: Text(
                        "Day 1",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: _day1 ? Colors.white : Colors.black,
                          // color: Colors.black,
                        ),
                      ),
                    ),
                    CircleButton(
                      // ignore: sdk_version_set_literal
                      onTap: () => {
                        setState(
                          () {
                            _day2 = !_day2;
                          },
                        ),
                      },
                      width: 75.0,
                      height: 75.0,
                      borderColor: Colors.black,
                      borderWidth: 2.5,
                      borderStyle: BorderStyle.solid,
                      backgroundColor: _day2 ? Colors.black : Colors.white,
                      // backgroundColor: Colors.white,
                      child: Text(
                        "Day 2",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: _day2 ? Colors.white : Colors.black,
                          // color: Colors.black,
                        ),
                      ),
                    ),
                    CircleButton(
                      // ignore: sdk_version_set_literal
                      onTap: () => {
                        setState(
                          () {
                            _day3 = !_day3;
                          },
                        ),
                      },
                      width: 75.0,
                      height: 75.0,
                      borderColor: Colors.black,
                      borderWidth: 2.5,
                      borderStyle: BorderStyle.solid,
                      backgroundColor: _day3 ? Colors.black : Colors.white,
                      // backgroundColor: Colors.white,
                      child: Text(
                        "Day 3",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: _day3 ? Colors.white : Colors.black,
                          // color: Colors.black,
                        ),
                      ),
                    ),
                    CircleButton(
                      // ignore: sdk_version_set_literal
                      onTap: () => {
                        setState(
                          () {
                            _day4 = !_day4;
                          },
                        ),
                      },
                      width: 75.0,
                      height: 75.0,
                      borderColor: Colors.black,
                      borderWidth: 2.5,
                      borderStyle: BorderStyle.solid,
                      backgroundColor: _day4 ? Colors.black : Colors.white,
                      // backgroundColor: Colors.white,
                      child: Text(
                        "Day 4",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: _day4 ? Colors.white : Colors.black,
                          // color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasBeenPressedm = !_hasBeenPressedm;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: _hasBeenPressedm
                            ? MaterialStateProperty.all(Colors.black)
                            : MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        "Morning",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: _hasBeenPressedm ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasBeenPresseda = !_hasBeenPresseda;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: _hasBeenPresseda
                            ? MaterialStateProperty.all(Colors.black)
                            : MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        "Afternoon",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: _hasBeenPresseda ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasBeenPressede = !_hasBeenPressede;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: _hasBeenPressede
                            ? MaterialStateProperty.all(Colors.black)
                            : MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        "Evening",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: _hasBeenPressede ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasBeenPressedn = !_hasBeenPressedn;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: _hasBeenPressedn
                            ? MaterialStateProperty.all(Colors.black)
                            : MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        "Night",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: _hasBeenPressedn ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        append();
                        print(Morning);
                        Navigator.pop(context, Planning.id);
                        // TODO enable to go back
                        // setState(() { Navigator.pop(context); });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        minimumSize: Size(200, 50),
                      ),
                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  Widget _body() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          buildSlider(),
          SizedBox(height: 20),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${key}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border_outlined,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 14,
                    color: Colors.blueGrey[300],
                  ),
                  SizedBox(width: 3),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${location[key]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blueGrey[300],
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${price[key]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xFF219529),
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${details[key]}",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ],
      ),
    );
  }

  buildSlider() {
    return Container(
      padding: EdgeInsets.only(left: 0),
      height: 250.0,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: places == null ? 0 : places.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = places[index];

          return Padding(
            padding: EdgeInsets.only(right: 0.0),
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                "${img[key]}",
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
