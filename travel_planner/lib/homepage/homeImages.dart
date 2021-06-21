import 'package:flutter/material.dart';

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

List<Image> restaurants = [
  Image.asset(
    "assets/images/6.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/7.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/8.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/9.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/10.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  )
];
List<String> restroName = [
  "Cafe El-Chico",
  "Barcode- Restro & Bar",
  "Old School Cafe",
  "The Tamarind Tree",
  "R.P Lounge & Restaurant"
];
List<String> hotelName = [
  "Hotel Kanha Shyam",
  "Hotel Kashi",
  "Hotel Grand Continent",
  "Hotel 4 View",
  "Hotel Ajay International"
];
List<Image> hotels = [
  Image.asset(
    "assets/images/1.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/2.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/3.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/4.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/5.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  )
];
List<String> placeName = [
  "Goakarna",
  "Himalayas",
  "Andaman & Nicobar",
  "Kasol",
  "Kerala"
];
List<Image> places = [
  Image.asset(
    "assets/images/gokarna.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/himalaya.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/andaman.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/kasol.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  ),
  Image.asset(
    "assets/images/kerala.jpg",
    height: 240,
    width: 240,
    fit: BoxFit.fill,
  )
];
final List<Images> place = generateImages(places, placeName);
final List<Images> hotel = generateImages(hotels, hotelName);
final List<Images> restro = generateImages(restaurants, restroName);
int count = 0;
GestureDetector gest(Images img) {
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
    child: Row(
      children: [
        Text(
          "$str",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
