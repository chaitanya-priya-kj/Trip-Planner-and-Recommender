import 'package:flutter/material.dart';
import 'planImages.dart';
import 'caro.dart';
import 'package:travel_planner/itinerary/itinerary.dart';

class Planning extends StatefulWidget {
  static const String id = 'planning';
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
                    pad("Places To Visit"),
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
                        children: place.map<GestureDetector>(
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
                    pad("Things To Do"),
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
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Iitinerary()));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      minimumSize: Size(100, 40),
                    ),
                    child: Text(
                      "Go To Itinerary",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.white,
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
