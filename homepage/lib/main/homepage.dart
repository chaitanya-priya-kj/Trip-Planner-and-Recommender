import 'package:flutter/material.dart';
import 'search.dart';
import 'caro.dart';
import 'homeImages.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double get deviceWidth => MediaQuery.of(context).size.width;
  double get deviceHeight => MediaQuery.of(context).size.height;
  void query(String fetch) {}
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: deviceHeight,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                            image: AssetImage("assets/images/temp.jpg"),
                            height: 50,
                            width: 60),
                      ),
                      Align(
                        alignment: Alignment(50, 50),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 190),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ButtonTheme(
                                minWidth: 120,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => search())),
                                    print("Search Button Pressed")
                                  },
                                  color: Colors.grey.withOpacity(1.0),
                                  padding: EdgeInsets.all(1.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text("Search"),
                                      Icon(Icons.search),
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
                  CarouselWithIndicatorDemo(),
                  pad("Places For You"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 1, 0, 1),
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
                  pad("Hotels Near You"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 1, 0, 1),
                    child: SizedBox(
                      height: 150,
                      width: deviceWidth,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: hotel.map<GestureDetector>((Images img) {
                            return gest(img);
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  pad("Restaurants Near You"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 1, 0, 1),
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
                  SizedBox(height: 150)
                ],
              ),
            ),
            Positioned(
              top: deviceHeight * 0.80,
              left: 50,
              right: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(icon: Icon(Icons.home), onPressed: () {}),
                          IconButton(
                              icon: Icon(Icons.thumb_up_alt_rounded),
                              onPressed: () {}),
                          IconButton(icon: Icon(Icons.map), onPressed: () {}),
                          IconButton(icon: Icon(Icons.note), onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
