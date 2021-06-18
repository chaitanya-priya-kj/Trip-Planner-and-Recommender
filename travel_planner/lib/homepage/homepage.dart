import 'package:flutter/material.dart';
import 'caro.dart';
import 'homeImages.dart';
import 'package:toast/toast.dart';
import 'package:travel_planner/overview/place_overview.dart';

class Homepage extends StatefulWidget {
  static const String id = 'homepage';
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
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: deviceHeight,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        Align(
                          alignment: Alignment(50, 50),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 190),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ButtonTheme(
                                  // minWidth: 120,
                                  child: FlatButton(
                                    height: 30,
                                    minWidth: 120,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.grey.shade900,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    onPressed: () => {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => search())),
                                      showSearch(
                                          context: context, delegate: Search()),
                                      // print("Search Button Pressed")
                                    },
                                    // color: Colors.grey.withOpacity(1.0),
                                    padding: EdgeInsets.all(1.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text("Search"),
                                        Icon(
                                          Icons.search,
                                        ),
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
                top: deviceHeight * 0.87,
                left: 30,
                right: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: 410,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black.withOpacity(0.57),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                icon: Icon(Icons.home), onPressed: () {}),
                            IconButton(
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent[700],
                                  size: 30.0,
                                ),
                                onPressed: () {}),
                            IconButton(icon: Icon(Icons.map), onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.note), onPressed: () {}),
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
      ),
    );
  }
}

//Search Button
class Search extends SearchDelegate<String> {
  final cities = [
    "new delhi",
    "new old",
    "new hello",
    "indore",
    "jalalpur",
    "kanpur",
    "chennai",
    "rajkot",
    "lucknow"
  ];
  final recentcities = [
    "jalalpur",
    "kanpur",
    "chennai",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
    // throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
    // throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return PlaceDetails(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final sugglist = query.isEmpty
        ? recentcities
        : cities.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: sugglist[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: sugglist[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: sugglist.length,
    );
    // throw UnimplementedError();
  }
}
