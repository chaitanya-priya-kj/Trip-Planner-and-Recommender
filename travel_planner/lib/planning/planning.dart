import 'package:flutter/material.dart';
import 'planImages.dart';
import 'caro.dart';

class Planning extends StatefulWidget {
  late final String str, days;
  Planning(String name, String nod) {
    this.str = name;
    this.days = nod;
  }
  @override
  _PlanningState createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  String placeName = "", days = "";
  @override
  void initState() {
    super.initState();
    placeName = widget.str;
    days = widget.days;
  }
  //TODO: Get Place Name from database. Take place name as input from overview page
  // set getPlaceName(String str) {
  //   this.txt = str;
  // }

  double get deviceWidth => MediaQuery.of(context).size.width;
  double get deviceHeight => MediaQuery.of(context).size.height;
  // void query(String fetch) {}
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: deviceHeight,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselWithIndicatorDemo(),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    "$placeName",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    pad("Hotels For You"),
                    TextButton(
                      onPressed: () {
                        print("View More Button Pressed");
                      },
                      child: Text(
                        "View More",
                        // style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: SizedBox(
                    height: 150,
                    width: deviceWidth,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: hotel.map<GestureDetector>(
                          (Images img) {
                            return gest(img, context);
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    pad("Restaurants For You"),
                    TextButton(
                      onPressed: () {
                        print("View More Button Pressed");
                      },
                      child: Text(
                        "View More",
                        // style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: SizedBox(
                    height: 150,
                    width: deviceWidth,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: restro.map<GestureDetector>((Images img) {
                          return gest(img, context);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    pad("Events For You"),
                    TextButton(
                      onPressed: () {
                        print("View More Button Pressed");
                      },
                      child: Text(
                        "View More",
                        // style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: SizedBox(
                    height: 150,
                    width: deviceWidth,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: event.map<GestureDetector>((Images img) {
                          return gest(img, context);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
