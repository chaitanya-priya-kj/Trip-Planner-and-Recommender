import 'package:flutter/material.dart';
import 'package:travel_planner/authorization/constraints.dart';
import 'package:travel_planner/planning/planning.dart';
import 'places.dart';
// import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:circle_button/circle_button.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:travel_planner/planning/planning.dart';

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

class PlaceDetails extends StatefulWidget {
  late final String str;
  PlaceDetails(String name) {
    this.str = name;
  }
  @override
  _Details createState() => _Details();
}

class _Details extends State<PlaceDetails> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  late String placeName;
  String numberOfdays = "";
  @override
  void initState() {
    super.initState();
    placeName = widget.str;
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

  @override
  Widget build(BuildContext context) {
    //TODO decrease .50 to decrease the length of the pop up
    _panelHeightOpen = MediaQuery.of(context).size.height * .50;
    return Scaffold(
      body: Stack(
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
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
        ],
      ),
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
                  "Let's plan,",
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Enter Number Of Days: ",
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: 50.0,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22.0, height: 1.0, color: Colors.black),
                          onChanged: (value) {
                            numberOfdays = value;
                          },
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("$numberOfdays");
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Planning(placeName, numberOfdays)));
                        });
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
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //     ),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      // ),
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
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "$placeName",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
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
                      "${places[0]["location"]}",
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
                  "${places[0]["details"]}",
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
                "${place["img"]}",
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
