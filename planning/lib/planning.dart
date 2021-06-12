import 'package:flutter/material.dart';
import 'planImages.dart';
import 'search.dart';

class Planning extends StatefulWidget {
  @override
  _PlanningState createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
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
              // SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image(
                            image: AssetImage("assets/images/temp.jpg"),
                            height: 40,
                            width: 40),
                      ),
                      // Text("Hello,"),
                      Align(
                        alignment: Alignment(50, 50),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 190),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ButtonTheme(
                                // minWidth: 120,
                                child:  FlatButton(
                                  height: 30,
                                  minWidth: 120,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.grey.shade900, width: 1.5),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => search())),
                                    print("Search Button Pressed")
                                  },
                                  // color: Colors.grey.withOpacity(1.0),
                                  padding: EdgeInsets.all(1.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text("Search"),
                                      Icon(Icons.search,),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
              SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}
