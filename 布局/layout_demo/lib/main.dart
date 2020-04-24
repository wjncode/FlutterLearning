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
                      "文字",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Text(
                    '文字是人类用表义符号记录表达信息，使之传之久远的方式和工具。现代文字大多是记录语言的工具。人类往往先有口头的语言后产生书面文字，很多方言和小语种，有语言但没有文字。文字的不同体现了国家和民族的书面表达的方式和思维不同。文字使人类进入有历史记录的文明社会。',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    maxLines: 2,
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
          Padding(padding: EdgeInsets.only(top: 10.0),),
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
      padding: EdgeInsets.fromLTRB(32, 20, 32, 20),
      child: Text('''定义
文字是人类用表义符号记录表达信息，使之传之久远的方式和工具。现代文字多是记录语言的工具，人类往往先有口头的语言后产生书面的文字，很多方言和小语种，有语言但没有文字。
文与字
　　东汉许慎《〈说文解字〉叙》：“盖依类象形，故谓之文；其后形声相益，即谓之字，”也就是说，“文”是独体字（包含象形字和指事字），而“字”是由独体字组合的合体字（包含会意字、形声字、假借字）。
分类
文字按字音和字形，可分为表形文字、表音文字和意音文字。按语音和语素，可分为音素文字、音节文字和语素文字。
　　表形文字是人类早期原生文字的象形文字，比如：古埃及的圣书字、两河流域的楔形文字、古印度文字、美洲的玛雅文和早期的汉字。
表音文字用少量字母（大多不到50个）组成单词记录语言的语音进行表义的文字。表音文字可分为音节文字和音素文字。音节文字是以音节为单位的文字，如日文的假名。音素文字是以音素为单位的文字，比如英文字母26个，西文字母29个，俄文字母33个，韩文字母40个…… 世界上绝大多数文字都是表音文字。
意音文字是由表义的象形符号和表音的声旁组成的文字，汉字是由表形文字进化成的意音文字，汉字也是语素文字。
要素
语言的三要素是：语音、词汇和语法，文字的三要素是：音--语音、形--字符形状、义--意义。学习一门语言，往往连带学习它的文字，语言文字的要素有重复，合并同类型为四要素：语音、字符、词汇、语法。
属性
文字是不同国家和民族约定俗成的，由众多笔画简单的符号组成的，表达信息和传承文化的字符系统。
字符笔画简单
文字的笔画往往不多，复杂的符号就是图画了，虽然也能表义，但不便于书写和传播。
约定俗成
文字是不同民族和国家创造的约定俗成的字符系统，个人自创的不被民族和国家广泛认可的字符不算真正的文字。
系统
少数几个孤立的字符难以表达万事万物的海量信息，还不是文字，文字是由众多字符组成的一个表义的符号系统。基本的字符越少，意味字符的组合越长越复杂，基本字符越多，意味表达信息越简单。改革文字会牵一发而动全身。''')
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
