import 'package:flutter/material.dart';

class Item {
  Item(
    int i, {
    required this.headerValue,
    required this.count,
  });
  String headerValue;
  int count;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      index = index + 1,
      headerValue: "Day $index",
      count: index - 1,
    );
  });
}

class Iitinerary extends StatefulWidget {
  static const String id = 'itinerary';
  @override
  _Iitinerary createState() => _Iitinerary();
}

class _Iitinerary extends State<Iitinerary> {
  double get deviceHeight => MediaQuery.of(context).size.height;
  String place = "Goa";
  final List<Item> _data = generateItems(4);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            iconSize: 25,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Itinerary",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w300),
          ),
        ),
        body: SizedBox(
          height: deviceHeight,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "$place,",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: _data
                              .map<Padding>(
                                (item) => Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 10, 30, 15),
                                  child: Container(
                                    width: 300,
                                    height: 100,
                                    child: Card(
                                      color: Colors.teal[50],
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: TextButton(
                                        autofocus: true,
                                        child: Text(
                                          item.headerValue,
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => dayss(
                                                        days: item.headerValue,
                                                        daycount: item.count,
                                                      )));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                    ],
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

List<String> maen = ["Morning", "Afternoon", "Evening", "Night"];

List<List<List<String>>> sd = [
  [
    ["hotel", "sgs", "event", "sdfs"],
    ["resto", "sdfff"],
    ["resto", "hotel"],
    ["event"]
  ],
  [
    ["resto", "hotel", "event"],
    ["event"],
    ["resto", "event"],
    ["event"]
  ],
  [
    ["hjhgh", "resto", "hotel"],
    ["event"],
    ["hotel", "event"],
    ["resto"]
  ],
  [
    ["resto", "event"],
    ["hotel"],
    ["resto", "event"],
    ["hotel"]
  ]
];

class dayss extends StatefulWidget {
  final String days;
  final int daycount;
  dayss({Key? key, required this.days, required this.daycount})
      : super(key: key);
  @override
  _Days createState() => _Days();
}

class _Days extends State<dayss> {
  final List<Item> _data = generateItems(4);
  double get deviceHeight => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            iconSize: 25,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: (Text(widget.days,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w300))),
        ),
        // height: deviceHeight,
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _data
                      .map<Column>(
                        (Item) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                maen[Item.count],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Column(
                              children: generateItems(
                                      sd[widget.daycount][Item.count].length)
                                  .map<Padding>(
                                    (item) => Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          30, 10, 30, 10),
                                      child: Container(
                                          width: 400,
                                          height: 100,
                                          child: printcard(
                                              Item.count, item.count)),
                                    ),
                                  )
                                  .toList(),
                            )
                          ],
                        ),
                      )
                      .toList())),
        ),
      ),
    );
  }

  Card printcard(int Item, int item) {
    return Card(
      color: Colors.teal[50],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextButton(
        child: Text(
          sd[widget.daycount][Item][item],
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
        ),
        onPressed: () {},
      ),
    );
  }
}
