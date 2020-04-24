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
        // primarySwatch: Colors.red,
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '布局'),
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

  @override
  Widget build(BuildContext context) {
    // 图片
    Widget imageSection = new Container(
      padding: EdgeInsets.only(top: 0),
      child: Image.asset('images/timg.jpeg',
        height: 240.0,
        fit: BoxFit.cover,
      ),
    );

    // 实现标题行
    Widget titleSection = new Container (
        padding: EdgeInsets.all(32.0),
        color: Colors.white,
        child: Row(
          children: [
            // 左半部分上下标题/副标题
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(// 创建一个容器,标题在容器中设置下边距,也可以在外部设置边距
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "我是大标题",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Text(
                    '我是一个挺长的副标题',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            // 右边小星星
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            // 设置右边距
            Padding(padding: EdgeInsets.only(right: 8)),
            // 右边数字
            Text('41'),
          ],
        ),
    );

 // 自定义按钮定制
    Column buildButtonColumn(IconData icon, String label) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blue),
          Padding(padding: EdgeInsets.only(top: 20.0),),
          Text(
            label, 
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ],
      );
    }

    // 按钮行创建
    Widget buttonSection = Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButtonColumn(Icons.call, "打电话"),
            buildButtonColumn(Icons.near_me, "找我"),
            buildButtonColumn(Icons.share, "分享"),
          ],
        ),
    );

    // 正文创建
    Widget textSection = Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(32, 40, 32, 0),
      child: Text('今天是个好日子,心想的事情都能成.今天是个好日子,心想的事情都能成.今天是个好日子,心想的事情都能成.今天是个好日子,心想的事情都能成.今天是个好日子,心想的事情都能成.今天是个好日子,心想的事情都能成.今天是个好日子,心想的事情都能成.')
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView (
        
        children: [
          // 图片模块
          imageSection,
          // 标题模块
          titleSection,
          // 按钮模块
          buttonSection,
          // 正文模块
          textSection,
        ],
      ),
    );
    

  }
}
