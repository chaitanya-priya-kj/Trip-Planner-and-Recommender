import 'package:flutter/material.dart';
import 'package:travel_planner/overview/overview.dart';

class Images {
  Images(
    int i, {
    required this.Imagelink,
    required this.Imagename,
  });
  Image Imagelink;
  String Imagename;
}

List<Images> generateImages(List item, List name) {
  int numberOfItems = item.length;
  return List<Images>.generate(numberOfItems, (int index) {
    return Images(
      index = index,
      Imagelink: item[index],
      Imagename: "${name[index]}",
    );
  });
}

List<String> restroName = [
  "SeaFood Delights",
  "Amaya",
  "The Sunset Lounge At Symphony Samudra",
  "Red Snapper",
  "Dugong"
];
List<Image> restaurants = [
  Image.asset(
    "assets/images/seafood.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/amaya.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/sunsetlounge.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/redsnapper.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/dugong.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  )
];
List<String> hotelName = [
  "Lemon Tree Hotel Port Blair",
  "Havelock Island Beach Resort",
  "Sea Shell Samssara",
  "Silver Sand Beach Resort",
  "Peerless Resort Portblair"
];
List<Image> hotels = [
  Image.asset(
    "assets/images/lemontree.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/havelock.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/seashell.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/silversand.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/peerless.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  )
];
List<String> placeName = [
  "Elephant Beach",
  "Long Island Port Blair",
  "Neill Island",
  "Rutland Island",
  "Narcondam Island"
];
List<Image> places = [
  Image.asset(
    "assets/images/elephant.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/long.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/neill.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/rutland.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/narcondam.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  )
];
List<String> things = [
  "Cellular Jail Andaman",
  "Discover Scuba Dive(Shore)",
  "Night Kayaking At Swaraj Dweep(Havelock) Andamans",
  "History Buffs Trails to Ross Island",
  "Seakart Self Drive Excursion in Corbyns Cove Beach",
  "Heritage and Cultural Walk of Port Blair"
];
List<Image> events = [
  Image.asset(
    "assets/images/cellular.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/scuba.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/kayaking.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/history.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/seakart.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/heritage.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  )
];
final List<Images> place = generateImages(places, placeName);
final List<Images> hotel = generateImages(hotels, hotelName);
final List<Images> restro = generateImages(restaurants, restroName);
final List<Images> event = generateImages(events, things);
int count = 0;
GestureDetector gest(Images img, BuildContext context) {
  return GestureDetector(
    onTap: () {
      print(img.Imagename);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OverviewDetails(img.Imagename)));
      count++;
      // OverviewDetails();
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
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
}

Padding pad(String str) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
    child: Text(
      "$str",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
