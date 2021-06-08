import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'caro.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double get deviceWidth => MediaQuery.of(context).size.width;
  double get deviceHeight => MediaQuery.of(context).size.height;

  List<Image> places = [
    Image.asset("assets/images/1.jpg"),
    Image.asset("assets/images/2.jpg"),
    Image.asset("assets/images/3.jpg"),
    Image.asset("assets/images/4.jpg"),
    Image.asset("assets/images/5.jpg")
  ];
  List<Image> hotels = [
    Image.asset("assets/images/1.jpg"),
    Image.asset("assets/images/2.jpg"),
    Image.asset("assets/images/3.jpg"),
    Image.asset("assets/images/4.jpg"),
    Image.asset("assets/images/5.jpg")
  ];
  List<Image> restaurants = [
    Image.asset("assets/images/1.jpg"),
    Image.asset("assets/images/2.jpg"),
    Image.asset("assets/images/3.jpg"),
    Image.asset("assets/images/4.jpg"),
    Image.asset("assets/images/5.jpg")
  ];
  void query(String fetch) {}

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
                      Positioned(
                        bottom: deviceHeight * 0.9,
                        left: 50,
                        right: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 190),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ButtonTheme(
                                minWidth: 120,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  onPressed: () => {},
                                  color: Colors.grey,
                                  padding: EdgeInsets.all(1.0),
                                  child: Row(
                                    // Replace with a Row for horizontal icon + text
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 1, 0, 1),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Places For You",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 1, 0, 1),
                    child: SizedBox(
                      height: 150,
                      width: deviceWidth,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: places,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 1, 0, 1),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Hotels Near You",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 1, 0, 1),
                    child: SizedBox(
                      height: 150,
                      width: deviceWidth,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: hotels,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 1, 0, 1),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Restaurants Near You",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 1, 0, 1),
                    child: SizedBox(
                      height: 150,
                      width: deviceWidth,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: restaurants,
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
