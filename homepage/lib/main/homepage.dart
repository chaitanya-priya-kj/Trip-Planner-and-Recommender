import 'package:flutter/material.dart';

import "package:story_view/story_view.dart";

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double get deviceWidth => MediaQuery.of(context).size.width;
  double get deviceHeight => MediaQuery.of(context).size.height;

  final StoryController controller = StoryController();

  int count = 0;

  List<Image> paths = [];

  counter() {
    print(count);
    if (count == 1) {
      paths.add(Image.asset("assets/images/1.jpg"));
    }
    if (count == 2) {
      paths.add(Image.asset("assets/images/2.jpg"));
    }
    if (count == 3) {
      paths.add(Image.asset("assets/images/3.jpg"));
    }
    if (count == 4) {
      paths.add(Image.asset("assets/images/4.jpg"));
    }
    if (count == 5) {
      paths.add(Image.asset("assets/images/5.jpg"));
    }
  }

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
                  Container(
                    height: 300,
                    padding: EdgeInsets.all(8.0),
                    child: StoryView(
                      repeat: true,
                      progressPosition: ProgressPosition.bottom,
                      controller: controller,
                      storyItems: [
                        StoryItem.text(
                          title:
                              "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
                          backgroundColor: Colors.orange,
                          roundedTop: true,
                        ),
                        // StoryItem.inlineImage(
                        //   NetworkImage(
                        //       "https://image.ibb.co/gCZFbx/Banku-and-tilapia.jpg"),
                        //   caption: Text(
                        //     "Banku & Tilapia. The food to keep you charged whole day.\n#1 Local food.",
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       backgroundColor: Colors.black54,
                        //       fontSize: 17,
                        //     ),
                        //   ),
                        // ),
                        StoryItem.inlineProviderImage(
                          AssetImage("assets/images/1.jpg"),
                          // controller: controller,
                        ),
                        StoryItem.inlineImage(
                          url:
                              "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                          controller: controller,
                          caption: Text(
                            "Hektas, sektas and skatad",
                            style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.black54,
                              fontSize: 17,
                            ),
                          ),
                        )
                      ],
                      // onStoryShow: (s) {
                      //   print("Showing a story");
                      // },
                      // onComplete: () {
                      //   print("Completed a cycle");
                      // },
                      // progressPosition: ProgressPosition.bottom,
                      // repeat: false,
                      // inline: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Hotels For You",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.plus_one,
                                ),
                                onPressed: () {
                                  count++;
                                  setState(() {
                                    counter();
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150,
                      width: deviceWidth,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: paths,
                        ),
                      ),
                    ),
                  ),
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
                    )),
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
