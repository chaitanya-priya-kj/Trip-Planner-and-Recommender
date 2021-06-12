import 'package:flutter/material.dart';
import 'planImages.dart';
import 'caro.dart';

class Planning extends StatefulWidget {
  @override
  _PlanningState createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  String txt = "Goa";
  //TODO: Get Place Name from database. Take place name as input from overview page
  set getPlaceName(String str) {
    this.txt = str;
  }

  double get deviceWidth => MediaQuery.of(context).size.width;
  double get deviceHeight => MediaQuery.of(context).size.height;
  // void query(String fetch) {}
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  "$txt",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pad("Places For You"),
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
                      children: place.map<GestureDetector>((Images img) {
                        return gest(img);
                      }).toList(),
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
                          return gest(img);
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
                        return gest(img);
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
                        return gest(img);
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
    );
  }
}
