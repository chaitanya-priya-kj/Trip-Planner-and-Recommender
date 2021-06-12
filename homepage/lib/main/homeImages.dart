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

List<Images> generateImages(List item) {
  int numberOfItems = item.length;
  return List<Images>.generate(numberOfItems, (int index) {
    return Images(
      index = index,
      Imagelink: item[index],
      Imagename: "image $index",
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
final List<Images> place = generateImages(places);
final List<Images> hotel = generateImages(hotels);
final List<Images> restro = generateImages(restaurants);
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
    padding: const EdgeInsets.fromLTRB(6, 1, 0, 1),
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
