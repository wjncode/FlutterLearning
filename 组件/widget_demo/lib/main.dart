import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '组件'),
      routes: <String, WidgetBuilder> {
        '/text': (BuildContext context) => MyHomePage(title: 'Text'),
      },
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
  List widgets = [];

  var datas = [
    {'title': 'Text', 'detail': '文本内容', 'url': '/text'},
    {'title': 'Image', 'detail': '图像显示', 'url': '/image'}
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < datas.length; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    // 自定义listview样式
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 1.0,
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                Padding(padding: EdgeInsets.only(right: 10)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          datas[i]['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                      Text(
                        datas[i]['detail'],
                        style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, datas[i]['url']);
        });
  }
}
