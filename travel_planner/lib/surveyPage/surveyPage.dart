import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:travel_planner/homepage/homepage.dart';

class SurveyPage extends StatefulWidget {
  static const String id = 'surveyPage';

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  List<String> choiceMade = [];
  String next = "Next";
  late bool checkedValue = false;
  List<List<String>> options = [
    ["Warm and Sunny", "Calm and Cool", "Sunny and Humid", "Cold and Chilly"],
    [""],
    [""],
    [""],
    ["1 Star", "2 Star", "3 Star", "4 Star", "5 Star"],
    [""],
    ["Vegetarian", "Non-Vegetarian"],
    ["Alcohol", "Non-Alcohol", "Anything"],
    ["cuisine checkbox"]
  ];
  Map<String, bool> q2 = {
    "Trekking": false,
    "Mountains": false,
    "Beaches": false,
    "Water": false,
    "Sport": false,
    "Skiing": false,
    "Clubbing": false,
    "Sight": false,
    "Seeing": false
  };
  Map<String, bool> q5 = {
    "Pool": false,
    "Gym": false,
    "Outdoor": false,
    "Activities": false,
    "Pets Allowed": false,
    "Wi-Fi": false,
    "Air Conditioning": false,
    "Vehicle Parking": false
  };
  Map<String, bool> q8 = {
    "North Indian": false,
    "Chinese": false,
    "South Indian": false,
    "Italian": false,
    "Japanese": false,
    "Sea Food": false,
    "Korean": false
  };
  SfRangeValues _values = SfRangeValues(4000.0, 8000.0);
  List<String> questions = [
    "What kind of weather do you prefer on a vacation?",
    "On an average how much would you spend on a vacation?",
    "Which of the below would you prefer when you are on a vacation?",
    "Average price you spend or want to spend on hotels?",
    "Any preferred rating for hotels in which you wanna stay?",
    "Preffered amenities you want your hotel to have?",
    "Are you a vegetarian, non-vegetarian?",
    "Alcohol or Non-Alcohol",
    "Preferred cuisine?"
  ];
  String selection = "Pending";
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  "${questions[count]}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              count == 1 || count == 3
                  ? (count == 3
                      ? rangeSelector(1000.0, 20000.0, 7000.0)
                      : rangeSelector(1000.0, 50000.0, 10000.0))
                  : (count == 2 || count == 5 || count == 8
                      ? (count == 2
                          ? checkList(q2)
                          : (count == 5 ? checkList(q5) : checkList(q8)))
                      : optionRadioButton()),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // print("$selection");
                  // choiceMade.add(selection);
                  setState(() {
                    count++;
                    if (count == options.length - 1) {
                      print("Start over: $count");
                      next = "Done";
                    }

                    if (count == options.length) {
                      print("$count");
                      count = 0;
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Homepage()));
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  minimumSize: Size(100, 40),
                ),
                child: Text(
                  "$next",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double get deviceHeight => MediaQuery.of(context).size.height;
  Container checkList(Map<String, bool> value) {
    return Container(
      height: deviceHeight * 0.6,
      child: ListView(
          children: value.keys.map(
        (String key) {
          return CheckboxListTile(
            title: Text(
              key,
              style: TextStyle(fontSize: 15),
            ),
            value: value[key],
            onChanged: (newValue) {
              setState(() {
                value[key] = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          );
        },
      ).toList()),
    );
  }

  RadioGroup optionRadioButton() {
    return RadioGroup<String>.builder(
      groupValue: selection,
      onChanged: (value) => setState(() {
        selection = value!;
      }),
      items: options[count],
      itemBuilder: (item) => RadioButtonBuilder(
        item,
      ),
      activeColor: Colors.red,
    );
  }

  SfRangeSlider rangeSelector(double min, double max, double range) {
    return SfRangeSlider(
      min: min,
      max: max,
      values: _values,
      interval: range,
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      minorTicksPerInterval: 1,
      onChanged: (SfRangeValues values) {
        setState(() {
          _values = values;
        });
      },
    );
  }
}
