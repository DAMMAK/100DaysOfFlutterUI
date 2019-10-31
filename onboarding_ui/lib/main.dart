import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int count = 3;
  int currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  List<Widget> _indicatorBuilder() {
    List<Widget> indicators = [];
    for (int i = 0; i < count; i++) {
      indicators.add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          color: isActive ? Colors.blue : Colors.grey),
    );
  }

  Widget _bottomControl() {
    return currentIndex != 2
        ? Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    setState(() {
                      // currentIndex++;
                    });
                  },
                  child: Text("SKIP"),
                  textColor: Colors.grey,
                ),
                Row(
                  children: _indicatorBuilder(),
                ),
                FlatButton(
                  onPressed: () {
                    _pageController.animateToPage(++currentIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  child: Text("NEXT"),
                  textColor: Colors.blue,
                ),
              ],
            ),
          )
        : Center(
            child: FlatButton(
            onPressed: () {
              setState(() {});
            },
            child: Text("GET STARTED!", style: TextStyle(letterSpacing: 1.5)),
            textColor: Colors.blue,
          ));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            // color: Colors.orange,
            height: 0.9 * height,
            child: PageView(
              physics: ClampingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  currentIndex = page;
                });
              },
              children: <Widget>[
                pageOne(height, width),
                pageTwo(height, width),
                pageThree(height, width),
              ],
            ),
          ),
          _bottomControl()
        ],
      ),
    );
  }

  

  Widget pageOne(height, width) => Padding(
      padding: EdgeInsets.symmetric(
          vertical: 0.13 * height, horizontal: 0.05 * width),
      child: Column(
        children: <Widget>[
          Container(
              height: 0.4 * height,
              width: double.infinity,
              // color: Colors.orange,
              child: Image.asset("images/first.jpg")),
          SizedBox(
            height: 40.0,
          ),
          Center(
            child: Text(
              "Keep Track where and when \n \t\t\t\t\t\t\t\t\t\t\t your time is",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 0.8 * width,
            height: 55.0,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do sed do",
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.5),
            ),
          )
        ],
      ));

  Widget pageTwo(height, width) => Padding(
      padding: EdgeInsets.symmetric(
          vertical: 0.13 * height, horizontal: 0.05 * width),
      child: Column(
        children: <Widget>[
          Container(
              height: 0.4 * height,
              width: double.infinity,
              // color: Colors.orange,
              child: Image.asset("images/second.jpg")),
          SizedBox(
            height: 40.0,
          ),
          Center(
            child: Text(
              "Easy meetings and calls \n \t\t\t\t\t\t with your team",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 0.8 * width,
            height: 55.0,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do sed do",
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.5),
            ),
          )
        ],
      ));

  Widget pageThree(height, width) => Padding(
      padding: EdgeInsets.symmetric(
          vertical: 0.13 * height, horizontal: 0.05 * width),
      child: Column(
        children: <Widget>[
          Container(
              height: 0.4 * height,
              width: double.infinity,
              // color: Colors.orange,
              child: Image.asset("images/third.jpg")),
          SizedBox(
            height: 40.0,
          ),
          Center(
            child: Text(
              "Keep Tyour team get update \n \t\t\t\t\t\t\t\t\t\t\t on your progress",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 0.8 * width,
            height: 55.0,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do sed do",
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.5),
            ),
          )
        ],
      ));
}
