import 'package:flutter/material.dart';

class Planning extends StatefulWidget {
  @override
  _PlanningState createState() => _PlanningState();
}

class Images {
  Images(
    int i, {
    required this.Imagelink,
    required this.Imagename,
  });
  Image Imagelink;
  String Imagename;
}

List<Images> generateImages(List item) {
  int numberOfItems = item.length;
  return List<Images>.generate(numberOfItems, (int index) {
    return Images(
      index = index,
      Imagelink: item[index],
      Imagename: "Image $index",
    );
  });
}

List<Image> restaurants = [
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
List<Image> places = [
  Image.asset("assets/images/1.jpg"),
  Image.asset("assets/images/2.jpg"),
  Image.asset("assets/images/3.jpg"),
  Image.asset("assets/images/4.jpg"),
  Image.asset("assets/images/5.jpg")
];
List<Image> events = [
  Image.asset("assets/images/1.jpg"),
  Image.asset("assets/images/2.jpg"),
  Image.asset("assets/images/3.jpg"),
  Image.asset("assets/images/4.jpg"),
  Image.asset("assets/images/5.jpg")
];

class _PlanningState extends State<Planning> {
  double get deviceWidth => MediaQuery.of(context).size.width;
  double get deviceHeight => MediaQuery.of(context).size.height;

  final List<Images> place = generateImages(places);
  final List<Images> hotel = generateImages(hotels);
  final List<Images> restro = generateImages(restaurants);
  final List<Images> event = generateImages(events);
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6, bottom: 1, top: 1),
                    child: Text(
                      "Places For You",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 165.0, top: 2, bottom: 1),
                    child: TextButton(
                      onPressed: () {
                        print("View More Button Pressed");
                      },
                      child: Text(
                        "View More",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
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
                        return GestureDetector(
                          onTap: () {
                            print(img.Imagename);
                            count++;
                          },
                          child: Stack(
                            children: [
                              img.Imagelink,
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  child: Text(
                                    '${img.Imagename}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6, bottom: 1, top: 1),
                    child: Text(
                      "Hotels For You",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 165.0, top: 2, bottom: 1),
                    child: TextButton(
                      onPressed: () {
                        print("View More Button Pressed");
                      },
                      child: Text(
                        "View More",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
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
                          return GestureDetector(
                            onTap: () {
                              print(img.Imagename);
                              count++;
                            },
                            child: Stack(
                              children: [
                                img.Imagelink,
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    child: Text(
                                      '${img.Imagename}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6, bottom: 1, top: 1),
                    child: Text(
                      "Restaurants For You",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 120.0, top: 2, bottom: 1),
                    child: TextButton(
                      onPressed: () {
                        print("View More Button Pressed");
                      },
                      child: Text(
                        "View More",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
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
                        return GestureDetector(
                          onTap: () {
                            print(img.Imagename);
                            count++;
                          },
                          child: Stack(
                            children: [
                              img.Imagelink,
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  child: Text(
                                    '${img.Imagename}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6, bottom: 1, top: 1),
                    child: Text(
                      "Events For You",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 165.0, top: 2, bottom: 1),
                    child: TextButton(
                      onPressed: () {
                        print("View More Button Pressed");
                      },
                      child: Text(
                        "View More",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
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
                        return GestureDetector(
                          onTap: () {
                            print(img.Imagename);
                            count++;
                          },
                          child: Stack(
                            children: [
                              img.Imagelink,
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  child: Text(
                                    '${img.Imagename}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
